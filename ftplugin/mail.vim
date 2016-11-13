" as per http://www.mdlerch.com/emailing-mutt-and-vim-advanced-config.html
" TODO: Implement http://tlattimore.com/blog/distraction-free-writing-in-vim/
setl tw=72
setl fo=aw

function IsReply()
    if line('$') > 1
        :g/^>\s\=--\s\=$/,$ delete
        :%!par w72q
        :%s/^.\+\ze\n\(>*$\)\@!/\0 /e
        :%s/^>*\zs\s\+$//e
        :1
        :put! =\"\n\n\"
        :1
    endif
endfunction

augroup mail_filetype
    autocmd!
    call IsReply()
    call pencil#init()
    startinsert
augroup END
