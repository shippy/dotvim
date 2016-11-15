" Inspired by Evan Dancer's .vimrc
"
" TODO: Set up Rails / Gems tag generation
" https://github.com/tpope/gem-ctags
" http://benoithamelin.tumblr.com/post/15101202004/using-vim-exuberant-ctags-easy-source-navigation
" http://blog.sensible.io/2014/05/09/supercharge-your-vim-into-ide-with-ctags.html
"
" TODO: Consider https://github.com/AndrewRadev/splitjoin.vim
"
" TODO: https://github.com/dahu/vim-fanfingtastic, 
" TODO for R: https://github.com/jalvesaq/Nvim-R,
" https://github.com/vim-pandoc/vim-rmarkdown,
" https://github.com/vim-pandoc/vim-pandoc

" Pathogen to load plugins
set nocompatible

" Exceptions for Mac
"let g:pathogen_disabled = []
"if has("unix")
  "let s:uname = system("uname -s")
  "if s:uname == "Darwin\n"
    "Remove plugins from Apple systems
  "endif
"endif

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()


" Preferences
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

set modelines=1

" No backup file (that's what git is for), no undo file (that's what yankring
" is for)
set nobackup
set noswapfile
set noundofile


" Searching/Moving
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

" Appearance
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
"set colorcolumn=80
set foldlevel=99    "File unfolded, always - use zM to close
"set guitablabel=\[%N\]\ %t\ %M

" Colors and Theme
try
	colorscheme ron
catch
endtry

set background=dark

" Auto Commands
" Get autocompletion for filetypes
set omnifunc=syntaxcomplete#Complete
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

" Only highlight current line in active split
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
" Auto source vimrc on save
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    "autocmd BufWritePost $MYVIMRC call Pl#ReloadColorscheme()
augroup END " }

" Restore cursor position
if has("autocmd")
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
endif

" Save on losing focus
au FocusLost * :wa

" Automatically leave insert mode after `updatetime` ms of inaction (Vimtips)
au CursorHoldI * stopinsert
au InsertEnter * let updaterestore=&updatetime | set updatetime=10000
au InsertLeave * let &updatetime=updaterestore

" Mappings
inoremap jk <ESC>

" Yank to end of line with Y
nnoremap Y y$	

" Quick-saving/exiting shortcuts
nmap <leader>w :w!<cr>
nmap fw :w!<cr>
command! W w !sudo tee % > /dev/null
nmap fq :q!<CR>

" Explode split to tab
nmap <leader>st <C-w>T

" Toggle paste
"nmap <leader>ip :set paste!<CR>
" NOTE: Replace by Unimpaired's yo/yO

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Toggle errors
"nmap <leader>st :SyntasticToggleMode<cr>

" Toggle Spell Checking 
nmap <silent> <leader>s :set spell!<CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Fucking F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Fucking capital Q
nnoremap Q <nop>

" Leader Mappings
" Update vimrc -- v OR ev
nmap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Update snipmate -- sc
nmap <leader>sc :tabedit ~/.vim/bundle/vim-snippets/snippets<CR>

" Ack -- a
nmap <Leader>a :Ack 
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Tab Editing
" Useful mappings for managing taps
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"map <C-t> :tabnext<CR>

" Extras for now

" Add quotes around word
nmap <Leader>" viwS"

" Add a line without changing position or leaving mode
"map <leader>o :set paste<cr>m`o<esc>``:set nopaste<cr>
"map <leader>O :set paste<cr>m`O<esc>``:set nopaste<cr>
" NOTE: Replaced by Unimpaired ]<Space> and [<Space>

" Functions
" Word count in LaTeX
function! WC()
    let filename = expand("%")
    " TODO: Escape `filename`
    let cmd = "detex " . filename . " | wc -w | xargs | tr -d '\n'"
    let result = system(cmd) . " words"
    echo result
endfunction
command! WC call WC()

nmap <localleader>lw :WC<CR>

" Remove trailing white space
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

" Set tabstop, softtabstop and shiftwidth to the same value
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

" Plugins

" Powerline
"call Pl#Theme#InsertSegment()

" Easy-motion
"let g:EasyMotion_leader_key = '<Leader>'

" EasyTag
set tags=./tags;
"let g:easytags_dynamic_files = 2
"let g:easytags_autorecurse = 1

" Emmet
let g:user_emmet_leader_key = '<c-e>'

"Fugitive Git
nmap <leader>ga :Git add %<CR><CR>
nmap <leader>gA :Git add -A<CR><CR>
" Two <CR>s to avoid the confirmation dialog. TODO
nmap <leader>gb :Gblame<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Dispatch! git push<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>

" Merginal
nmap <leader>gm :MerginalToggle<CR>

" Gist
let g:gist_post_private = 1
vmap <leader>gS :'<,'>Gist<CR>
nmap <leader>gS :Gist<CR>
nmap <leader>gSb :Gist -m<CR>

" CtrlP
let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_working_path_mode = 2 " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
"let g:ctrlp_switch_buffer = 'Et' " Jump to tab AND buffer if already open
"let g:ctrlp_split_window = 1 " <CR> = New Tab

nmap <leader>b :CtrlPBuffer<CR>
nnoremap <C-t> :CtrlP<CR>
"nmap <leader>m :CtrlPMRUFiles<CR>

" Gundo
nmap <leader>g :GundoToggle<CR>
let g:gundo_right = 1

" Markdown 
let g:vim_markdown_initial_foldlevel=1

" NerdTree
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1

" NerdTreeTabs
nmap <Leader>nn <plug>NERDTreeTabsToggle<CR>
nmap <Leader>nt :NERDTree<CR>
let g:nerdtree_tabs_open_on_console_startup = 0

" NerdCommenter (maps <C-/>)
map <C-_> <Plug>NERDCommenterToggle 

" Rainbow Parens
"nmap <leader>r :RainbowParentheses!!<CR>

" Syntastic
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" EnhancedJumps
let g:EnhancedJumps_CaptureJumpMessages = 0

" Using Cosco to smart-add semicolons / commas
autocmd FileType javascript,css,php nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css,php inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" PHP Snipmate only inserts php
"let g:snipMate = {}
"let g:snipMate.scope_aliases['php'] = 'php'

" Using vim as a writer / disable
augroup writing
  autocmd!
  autocmd FileType markdown,mkd,tex,text,mail setl spell spl=en |
        \ call textobj#sentence#init() |
        \ call pencil#init() |
        \ call litecorrect#init() | 
        \ call lexical#init() |
	\ DittoOn
        "\ setl columns=86
        "\ :Goyo
augroup END

augroup except_help
  autocmd!
  autocmd FileType help setl nospell
augroup END

set iskeyword+=_

let g:pencil#wrapModeDefault = 'soft'

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

" Markdown
let g:vim_markdown_folding_disabled=1

" Goyo
nmap <leader>g :Goyo<CR>

" Goyo - disable tmux on enter
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Ditto
nmap <leader>di <Plug>ToggleDitto      " Turn it on and off

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches"]

" Vimux (although don't forget about vim-ipython)
autocmd FileType python nmap <leader>vr :call VimuxRunCommand("ipython console")
autocmd FileType r nmap <leader>vr :call VimuxRunCommand("R")
autocmd FileType ruby nmap <leader>vr :call VimuxRunCommand("pry")
autocmd FileType matlab nmap <leader>vr :call VimuxRunCommand("matlab -nodesktop -nodisplay -nosplash")
" TODO: RSpec / Rails Console / other testing?

" Prompt command
map <leader>vp :VimuxPromptCommand

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
"<Leader>vsgg

" Specific MATLAB-debugging bindings (assuming an open Vimux pane)
augroup matlab_debug
  autocmd!
  autocmd FileType matlab nmap <localleader>d :call VimuxSendText("dbstop in " . expand('%:t') . " at " . line(".") . "\n")<CR> |
        \ nmap <localleader>s :call VimuxSendText("dbstep\n")<CR> |
        \ nmap <localleader>c :call VimuxSendText("dbcont\n")<CR> |
        \ nmap <localleader>r :call VimuxSendText("dbclear all\n")<CR> |
        \ nmap <localleader>q :call VimuxSendText("dbquit\n")<CR> |
        \ nmap <localleader>i :call VimuxSendText("dbstep in\n")<CR> |
        \ nmap <localleader>o :call VimuxSendText("dbstep out\n")<CR> |
        \ nmap <leader>vb :call VimuxSendText("cd('" . expand('%:p:h') . "');\n" . expand('%:t:r') . "\n")<CR>
augroup END
" TODO: imap <something> to make three dots, then linebreak

" Vim-RSpec + Vimux
let g:rspec_command = 'call VimuxRunCommand("xvfb-run bundle exec rspec {spec}\n")'
map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rr :call RunLastSpec()<CR>
map <Leader>rS :call RunAllSpecs()<CR>

map <Leader>rc :Econtroller<CR>
map <Leader>rm :Emodel<CR>
map <Leader>rv :Eview<CR>

" Rails related: view to controller, schema to model, ...
map <Leader>re :R<CR>

" Rails alternate: tests
map <Leader>ra :A<CR>

" Using Sneak to replace f
"nmap f <Plug>Sneak_s
"nmap F <Plug>Sneak_S
"xmap f <Plug>Sneak_s
"xmap F <Plug>Sneak_S
"omap f <Plug>Sneak_s
"omap F <Plug>Sneak_S

" SuperTab
let g:SuperTabDefaultCompletionType = 'context'
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \ endif

" Search-and-replace tip
" h/t: https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
"
" I search things usual way using /something
" I hit cs, replace first match, and hit <Esc>
" I hit n.n.n.n.n. reviewing and replacing all matches
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" CSV plugin
let g:csv_autocmd_arrange = 1

" Make / vim-dispatch
nmap <Leader>m :Dispatch<CR>
nmap <Leader>M :Dispatch!<CR>
