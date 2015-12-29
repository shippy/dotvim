" Inspired by Evan Dancer's .vimrc
" TODO: http://tlattimore.com/blog/distraction-free-writing-in-vim/
"
" Pathogen to load plugins {{{1
set nocompatible

" Exceptions for Mac
let g:pathogen_disabled = []
if has("unix")
  let s:uname = system("uname -s")
  "if s:uname == "Darwin\n"
    call add(g:pathogen_disabled, 'YouCompleteMe')
    call add(g:pathogen_disabled, 'phpcomplete-extended')
    call add(g:pathogen_disabled, 'phpcomplete_extended')
    call add(g:pathogen_disabled, 'vimproc')
  "endif
endif

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

" Preferences {{{1
filetype on
filetype plugin on
filetype indent on
syntax on
let mapleader =","								 " Set global mapleader
"let maplocalleader="\\"
set nocompatible
set noswapfile
set autoindent
set smartindent
set hidden                          " Useful for auto setting hidden buffers
set nostartofline                   " Don't reset cursor to start of line when moving around
set whichwrap+=<,>,h,l,[,]          " Wrap over end-of-line to next " TODO: Disable h & l if trouble arises
set ttyfast

set encoding=utf-8

set ffs=unix,dos,mac

" Searching/Moving {{{2
set gdefault                        " Add the g flag to search/replace by default
set incsearch                       " Highlight dynamically as pattern is typed
set hlsearch
set ignorecase											" Ignore case when searching
set smartcase												" Try and be smart about cases
set magic
nmap <Space> :nohlsearch<cr>
nmap <silent> <leader>h :set hlsearch!<CR>

nnoremap j gj
nnoremap k gk
set so=7

if has('mouse')
set mouse=a
endif

" Appearance {{{4
set number                          " Always show line numbers
set ts=2 sts=2 sw=2									" Default tab stops
set expandtab
set smarttab
set autoindent
set smartindent
set showcmd                         " Shows incomplete command
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set splitbelow										  " New window goes below
set splitright										  " New windows goes right
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*
set wildmenu                        " Enhance command-line completion
set wildmode=longest:full,full
set cursorline                      " Highlight current line
set laststatus=2                    " Always show the statusline
set t_Co=256                        " Explicitly tell Vim that the terminal supports 256 colors
set backspace=indent,eol,start
set colorcolumn=80
set foldlevel=99    "File unfolded, always - use zM to close

" Colors and Theme {{{2
try
	colorscheme ron
catch
endtry

set background=dark

" Auto Commands {{{1
" Only highlight current line in active split
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
" Auto source vimrc on save  {{{2
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd BufWritePost $MYVIMRC call Pl#ReloadColorscheme()
augroup END " }

" Restore cursor position {{{2
if has("autocmd")
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
endif

" Save on losing focus {{{2
au FocusLost * :wa

" Automatically leave insert mode after `updatetime` ms of inaction (Vimtips)
au CursorHoldI * stopinsert
au InsertEnter * let updaterestore=&updatetime | set updatetime=10000
au InsertLeave * let &updatetime=updaterestore

" Mappings {{{1
inoremap jk <ESC>

" Yank to end of line with Y
nnoremap Y y$	

" Quick-saving/exiting shortcuts
nmap <leader>w :w!<cr>
nmap fw :w!<cr>
command! W w !sudo tee % > /dev/null
nmap fq :q!<CR>

" Explode split to tab
nmap st <C-w>T

" Toggle paste
nmap <leader>ip :set paste!<CR>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Toggle errors
nmap <leader>st :SyntasticToggleMode<cr>

" Toggle Spell Checking 
nmap <silent> <leader>s :set spell!<CR>

" Bubble single lines {{{2
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Fucking F1 {{{2
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Fucking capital Q {{{2
nnoremap Q <nop>

" Leader Mappings {{{1
" Update vimrc -- v OR ev {{{3
nmap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Update snipmate -- sc {{{2
nmap <leader>sc :tabedit ~/.vim/bundle/vim-snippets/snippets<CR>

" Ack -- a {{{2
nmap <Leader>a :Ack

" Tab Editing {{{2
" Useful mappings for managing taps
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

map <C-t> :tabnext<CR>

" Extras for now {{{2

" Add quotes around word
nmap <Leader>" viwS"

" Add a line without changing position or leaving mode
map <leader>o :set paste<cr>m`o<esc>``:set nopaste<cr>
map <leader>O :set paste<cr>m`O<esc>``:set nopaste<cr>

" Functions {{{1
" Word count in LaTeX {{{2
function! WC()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w | xargs | tr -d '\n'"
    let result = system(cmd) . " words"
    echo result
endfunction
command! WC call WC()

nmap <localleader>lw :WC<CR>

" Remove trailing white space {{{2
function! Preserve(command)
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	execute a:command
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

" Prune the arglist for matches
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  "	  Building a hash ensures we get each buffer only once
  let buffer_numbers = { }
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Set tabstop, softtabstop and shiftwidth to the same value {{{2
command! -nargs=* Stab call Stab()
function! Stab()
	let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
	if l:tabstop > 0
		let &l:sts = l:tabstop
		let &l:ts = l:tabstop
		let &l:sw = l:tabstop
	endif
	call SummarizeTabs()
endfunction

function! SummarizeTabs()
	try
		echohl ModeMsg
		echon 'tabstop='.&l:ts
		echon ' shiftwidth='.&l:sw
		echon ' softtabstop='.&l:sts
		if &l:et
			echon ' expantab'
		else
			echon ' noexpandtab'
		endif
	finally
		echohl None
	endtry
endfunction

" Automatically load session
augroup sourcesession
  autocmd!
  autocmd VimEnter * nested
        \ if !argc() && empty(v:this_session) && filereadable('Session.vim') |
        \   source Session.vim |
        \ endif
augroup END

" Plugins {{{1

" Powerline
"call Pl#Theme#InsertSegment()

" Easy-motion {{{2
"let g:EasyMotion_leader_key = '<Leader>'

" EasyTag
set tags=./tags;
"let g:easytags_dynamic_files = 2
"let g:easytags_autorecurse = 1

" Emmet {{{2
let g:user_emmet_leader_key = '<c-e>'

"Fugitive Git {{{2
nmap <leader>ga :Git add -A<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>

" CtrlP {{{2
let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_working_path_mode = 2 " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
let g:ctrlp_split_window = 1 " <CR> = New Tab
let g:ctrlp_show_hidden = 1
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>p :CtrlP<CR>

" Gundo
nmap <leader>g :GundoToggle<CR>
let g:gundo_right = 1

" MultipleCursors {{{2
let g:multi_cursor_quit_key='<C-c>'

" Markdown {{{2
let g:vim_markdown_initial_foldlevel=1

" NerdTree {{{2
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1

" NerdTreeTabs
nmap <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0

" NerdCommenter (maps <C-/>)
map <C-_> <Plug>NERDCommenterToggle 

" Rainbow Parens {{{2
"nmap <leader>r :RainbowParenthesesToggle<CR>
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" Syntastic {{{2
let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Modelines {{{1
set modelines=1

" RSpec / Rails / Tmux integration
"let g:rspec_command = 'call Send_to_Tmux("xvfb-run bundle exec rspec {spec}\n")'
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>

" EnhancedJumps
let g:EnhancedJumps_CaptureJumpMessages = 0

" Using Cosco to smart-add semicolons / commas
autocmd FileType javascript,css,php nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css,php inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" PHP Snipmate only inserts php
"let g:snipMate = {}
"let g:snipMate.scope_aliases['php'] = 'php'

" Using vim as a writer / disable
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,tex call pencil#init() | setl spell spl=en
augroup END

augroup textobj_sentence
  autocmd!
  autocmd FileType markdown,mkd,tex,text call textobj#sentence#init()
augroup END
"set iskeyword+=,-_

let g:pencil#wrapModeDefault = 'hard'

let g:pencil#autoformat_blacklist = [
        \ 'markdownCode',
        \ 'markdownUrl',
        \ 'markdownIdDeclaration',
        \ 'markdownLinkDelimiter',
        \ 'markdownHighlight[A-Za-z0-9]+',
        \ 'mkdCode',
        \ 'mkdIndentCode',
        \ 'markdownFencedCodeBlock',
        \ 'markdownInlineCode',
        \ 'mmdTable[A-Za-z0-9]*',
        \ 'txtCode',
        \ 'texAbstract',
        \ 'texBeginEndName',
        \ 'texDelimiter',
        \ 'texDocType',
        \ 'texInputFile',
        \ 'texMath',
        \ 'texRefZone',
        \ 'texSection$',
        \ 'texStatement',
        \ 'texTitle',
        \ ]

" crosh makes a mess of unicode -> disable concealment
let g:tex_conceal='b'

"Goyo
nmap <leader>g :Goyo<CR>

" Goyo set up to turn off tmux status line on entering / leaving
function! s:goyo_enter()
  if exists('$TMUX')
    silent !tmux set status off
  endif
endfunction

function! s:goyo_leave()
  if exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
