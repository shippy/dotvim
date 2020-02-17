" get tmux title to update
" autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window ". expand("%"))

" Fix for crontab editing
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" Only highlight current line in active split
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" Auto source vimrc on save
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  if has('gui')
    autocmd BufWritePost $MYVIMRC,$MYGVIMRC source $MYGVIMRC
  endif
augroup END

" Restore cursor position
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

" Save on losing focus
au FocusLost * :silent! wa

" Automatically leave insert mode after `updatetime` ms of inaction (Vimtips)
au CursorHoldI * stopinsert
au InsertEnter * let updaterestore=&updatetime | set updatetime=20000
au InsertLeave * let &updatetime=updaterestore

" Automatically load session
augroup sourcesession
  autocmd!
  autocmd VimEnter * nested
        \ if !argc() && empty(v:this_session) && filereadable('Session.vim') |
        \   source Session.vim |
        \ endif
augroup END

" Using vim as a writer / disable
augroup writing
  autocmd!
  autocmd FileType markdown,mkd,tex,mail setl spell spl=en |
        \ setl tabstop=4 softtabstop=4 shiftwidth=4 |
        \ setl nonumber |
        \ call textobj#sentence#init() |
        \ call pencil#init() |
        \ call litecorrect#init() "|
        "\ call lexical#init()
augroup END

augroup except_help
  autocmd!
  autocmd FileType help setl nospell
  autocmd FileType help nnoremap <buffer> q :q<CR>
augroup END

" Remove whitespace on save (cribbed from @marcgg)
" autocmd! BufWritePre * call Preserve("%s/\\s\\+$//e")

augroup vimwiki
  autocmd BufNewFile,BufRead ~/vimwiki/* set ft=vimwiki syntax=vimwiki
augroup END

" Treat new files as markdown
autocmd BufEnter * if &filetype == "" | setlocal ft=text | endif
