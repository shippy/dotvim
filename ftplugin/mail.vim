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
    autocmd VimEnter /tmp/user* :call IsReply()
    autocmd VimEnter /tmp/user* :exe 'startinsert'
augroup END

"call pencil#init()
"let b:nerdtree_tabs_open_on_console_startup = 0
