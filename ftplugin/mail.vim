" as per http://www.mdlerch.com/emailing-mutt-and-vim-advanced-config.html
" TODO: Implement http://tlattimore.com/blog/distraction-free-writing-in-vim/
"setl tw=72
"setl fo=aw

" Escape out of Goyo and file without any permanent after-hooks
nnoremap <buffer> fq :qa!<CR>

" Is this e-mail a response (as opposed to an existing draft)?
function IsReply()
    if getline(1) =~ '^On \d'
        return 1
    endif
endfunction

function FormatReplyAndInsert()
    if line('$') > 1
        if IsReply()
            :g/^>\s\=--\s\=$/,$ delete
            :%s/^.\+\ze\n\(>*$\)\@!/\0 /e
            :%s/^>*\zs\s\+$//e
            :1
            :put! =\"\n\n\"
            :1
            " Hack: Since Goyo goes haywire with `startinsert`, use feedkeys("i")
            :call feedkeys("i")
        endif
    else
        " Completely new, blank e-mail
        :call feedkeys("i")
    endif
endfunction

augroup mail_filetype
    autocmd!
    call pencil#init({'wrap': 'soft'})
    call FormatReplyAndInsert()
    :Goyo
augroup END

"Note: Shelving the use of `par`, since it kills single-linebreak-separated
"paragraphs and doesn't seem to fix that much of a problem. Still, for future
"reference, here's a safe `par` call.

":call system("par")
"if v:shell_error == 0
    ":%!par w72q
"endif
