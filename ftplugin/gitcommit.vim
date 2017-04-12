augroup commit_autoinsert
    autocmd!
    au! BufRead,BufNewFile,BufEnter COMMIT_EDITMSG startinsert
    au! BufRead,BufNewFile,BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
    "This excludes the file opened by :Gstatus
augroup END
