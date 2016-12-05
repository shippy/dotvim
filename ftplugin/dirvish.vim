" Expected behavior:
" (1) quit on `q`
" (2) if sidebar, toggle on <leader>n
" (3) if sidebar, open files in previous pane (both with `o` and `p`)
" (and noop all this behavior as soon as the buffer switches to a different
" filetype?)
nnoremap <buffer> q :q!

" Auto-command - if last command is (...), or if this window is 20 wide, set
" Here's how NERDTree does it:
" - define a tab variable that says whether sidebar exists in the tab
" - broadcast user event: `silent doautocmd User NERDTreeInit`
" - temporarily ignore all AutoCmds (set ei = all)?
