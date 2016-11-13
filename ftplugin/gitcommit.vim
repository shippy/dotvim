augroup commit_autoinsert
    autocmd!
    au! BufRead,BufNewFile,BufEnter COMMIT_EDITMSG startinsert
    "This excludes the file opened by :Gstatus
augroup END
