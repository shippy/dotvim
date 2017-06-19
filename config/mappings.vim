let mapleader ="\<Space>"

nnoremap // :nohlsearch<cr>
" Center next match
nnoremap n nzz
nnoremap N Nzz

set iskeyword+=_

nnoremap j gj
nnoremap k gk

" I spend stupid amounts of time scrolling up and down with C-U and C-D
nnoremap <down> <C-d>
nnoremap <up> <C-u>

inoremap jj <ESC>
" Cribbed from @marcgg -- quick switch to previous file
nnoremap <space><space> :e#<CR>

" Trying out for size, thanks to Clever-f
noremap ; :

" Saving pinkies by removing one Shift press at a time
noremap ;e1 :e!
noremap ;5s :%s

" Sensible undo (inspired SpaceVim)
nnoremap U <c-r>

" Quick-saving/exiting shortcuts
nmap <leader>w :w!<cr>
nmap <leader>x :x!<cr>
nmap <leader>q :q!<cr>
command! W w !sudo tee % > /dev/null

" Change the directory to the current file
nnoremap <leader>cd lcd %:h

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Extend dot repeat to visual selection
vnoremap . :norm.<CR>

" Remove F1 and Q mappings
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Opposite of J (and I've opened way too many useless manpages)
nnoremap K i<Enter><esc>h

" Edit various important files
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>ez :tabedit ~/.zshrc<cr>
nnoremap <leader>es :tabedit ~/.vim/bundle/vim-snippets/snippets<CR>
nnoremap <leader>et :tabedit ~/.tmux/tmux.conf

" Dragonfly
" Preserve the vim custom of 'double-verb operates on a line'
nnoremap vv V

" ---- Plugin mappings ----
" Yanking
nnoremap <leader>p <Plug>yankstack_substitute_older_paste
nnoremap <leader>P :Yanks<CR>
nnoremap Y y$

" Ack
" Vanilla search
nmap <Leader>a :Ack! ""<left>
" Search word under cursor
nmap <Leader>* :Ack!<CR>
" Search the last search
nmap <Leader>A :AckFromSearch!<CR>
" Execute over every entry in quicklist
nmap <Leader>c :cdo<space>
nmap <Leader>C :cdo s//

" Cosco - smart-add semicolons / commas
autocmd FileType javascript,css,php,matlab nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css,php,matlab inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" CtrlP
nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>f :CtrlPMixed<CR>

" Dirvish / netrw
nnoremap <C-w>E :Explore<CR>
nnoremap <C-w>S :Sexplore<CR>
nnoremap <C-w>V :Vexplore<CR>
nnoremap <Leader>E :Explore<CR>
nnoremap <Leader>S :Sexplore<CR>
nnoremap <Leader>V :Vexplore<CR>

" Fugitive Git
nmap <leader>ga :Git add %<CR><CR>
nmap <leader>gA :Git add -A<CR><CR>
" Two <CR>s to avoid the confirmation dialog. TODO
nmap <leader>gb :Gblame<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Dispatch! git push<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
" Review staged changes (credit: http://stackoverflow.com/a/29454450/2114580)
nnoremap <leader>gr :Git! diff --staged<CR>

" ListToggle (*v*iew list)
let g:lt_location_list_toggle_map = '<leader>vl'
let g:lt_quickfix_list_toggle_map = '<leader>vq'
" TaskList ("view tasks")
nmap <Leader>vt <Plug>TaskList

" Make / vim-dispatch
nmap <Leader>m :Dispatch<CR>
nmap <Leader>M :Dispatch!<CR>

" Merginal
nmap <leader>gm :MerginalToggle<CR>

" NerdCommenter / Commentary (maps <C-/>)
"map <C-_> <Plug>NERDCommenterToggle
map <C-_> :Commentary<CR>

" Rainbow Parens
nmap <leader>] :RainbowParentheses!!<CR>

" Snipmate
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" Goyo
nmap <leader>g :Goyo<CR>

" #Unimpaired
" Add a line without changing position or leaving mode: ]<Space> and [<Space>
" Toggle paste while starting insert: yo/yO
" Toggle spell: cos
" Toggle hlsearch: coh

" Vimux
" Prompt command
map <leader>v :VimuxPromptCommand

function! VimuxSlime()
  " Grab register v
  call VimuxSendText(@v)
  "call VimuxSendKeys("Enter")
endfunction

" Repeat last command
nmap <leader>vl :call VimuxSlime()<CR>

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <leader>vs "vy :call VimuxSlime()<CR>
" (Alternative mapping)
vmap <C-b> <leader>vs<CR>

" Select current line and send it to tmux
nmap <leader>vv V<leader>vs<CR>
" Select current paragraph and send it to tmux
nmap <leader>vs vap<Leader>vs<CR>

" Execute current paragraph and move on to the next one
nmap <C-b> <leader>vs)<CR>

" Execute entire buffer (re-mapped for filetypes where a file can be passed
" for execution)
nmap <leader>vb ggVG<leader>vs

" Sneak
" Avoid clobbering by YankStack
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S

" ---- Function calls ----
" Remove whitespace on save (cribbed from @marcgg)
nnoremap <leader>= :silent call Preserve("normal gg=G")<CR>
nmap <localleader>lw call LatexWordCount()<CR>
