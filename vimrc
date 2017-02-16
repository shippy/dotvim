" Inspired by Evan Dancer's .vimrc
"
" TODO: This structuring of plugin settings - each in a file, the files
" programmatically sourced from folder - is appealing
" https://github.com/skwp/dotfiles/blob/master/vim/settings.vim
set nocompatible
filetype off

" Exceptions / special settings per system
if has("macunix")
  " OSX
  let $VIMHOME = $HOME."/.vim"
elseif has("unix") && !has("macunix")
  " non-OSX UNIX
  let $VIMHOME = $HOME."/.vim"
elseif has("win32unix")
  " cygwin/babun
  let $VIMHOME = $HOME."/.vim"
elseif has("win32") || has ('win64')
  " Windows
  let $VIMHOME = $HOME."/vimfiles"
endif

set runtimepath+=$VIMHOME/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" @tpope plugins
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
" TODO: Have a cheatsheet
Plugin 'tpope/vim-repeat'
" TODO: Make sure I know how it works

" Essential usage
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
" Two above: Make sure that SilverSearcher is used
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
" TODO: Complement with a better completion plugin
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-rsi'
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
" TODO: Investigate MATLAB not closing `end`?
Plugin 'rhysd/clever-f.vim'

" Usability improvements
Plugin 'tpope/vim-dispatch'
" TODO: Gracefully degrade mapping
Plugin 'Valloric/ListToggle'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'vim-scripts/EnhancedJumps'
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
Plugin 'xolox/vim-easytags'
" TODO: Make sure that this works across platforms
Plugin 'justinmk/vim-dirvish'
Plugin 'tpope/vim-sleuth'
Plugin 'Lokaltog/vim-easymotion'

" Visual
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/rainbow_parentheses.vim'

" Tmux interaction
Plugin 'tpope/vim-tbone'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'
" TODO: Figure out use case of tbone vs. vimux

" General coding
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'

" Language-specific
Plugin 'plasticboy/vim-markdown'
" Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'vim-ruby/vim-ruby'
" Plugin 'StanAngeloff/php.vim'
Plugin 'lervag/vimtex'
" Plugin 'ivanov/vim-ipython'
Plugin 'chrisbra/csv.vim'
" TODO for R: https://github.com/jalvesaq/Nvim-R,
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-scripts/MatlabFilesEdition'

" https://github.com/jeroendehaas/VimLab

" Rails
" Plugin 'tpope/vim-rails'
" Plugin 'thoughtbot/vim-rspec'
" Plugin 'skalnik/vim-vroom'
" http://benoithamelin.tumblr.com/post/15101202004/using-vim-exuberant-ctags-easy-source-navigation
" http://blog.sensible.io/2014/05/09/supercharge-your-vim-into-ide-with-ctags.html

" Writing
Plugin 'reedes/vim-pencil'
Plugin 'junegunn/goyo.vim'
Plugin 'reedes/vim-textobj-sentence'
Plugin 'reedes/vim-lexical'
Plugin 'reedes/vim-litecorrect'

" Text objects
Plugin 'rbonvall/vim-textobj-latex'
Plugin 'beloglazov/vim-textobj-punctuation'

" Prerequisites
Plugin 'kana/vim-textobj-user'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'vim-scripts/Vimball'
Plugin 'vim-scripts/ingo-library'
Plugin 'xolox/vim-misc'
Plugin 'mattn/webapi-vim'

" Experimental / barely used
" - Better vim
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-eunuch'
Plugin 'mjbrownie/swapit'
Plugin 'wellle/targets.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'reedes/vim-one'
Plugin 'sheerun/vim-polyglot'
Plugin 'rickhowe/diffchar.vim'
Plugin 'jaxbot/github-issues.vim'
" Plugin 'gastonsimone/vim-dokumentary'
" TODO: Remap K to grep word under cursor

" - Alignment
" Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-easy-align'
" Plugin 'tommcdo/vim-lion'

" - Yanking and undo
" Plugin 'sjl/gundo.vim'
" Plugin 'vim-scripts/YankRing.vim'
Plugin 'maxbrunsfeld/vim-yankstack'

" - Writing tools
" Plugin 'reedes/vim-wordy'
" Plugin 'dbmrq/vim-ditto'

" - Refactoring / easier code writing
" Plugin 'mattn/emmet-vim'
Plugin 'lfilho/cosco.vim'
Plugin 'tpope/vim-dotenv'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Chiel92/vim-autoformat'
" TODO: Install formatters for Octave, Ruby, Python

" - External services
Plugin 'mattn/gist-vim'
Plugin 'jaxbot/browserlink.vim'

" - Visual
Plugin 'idanarye/vim-merginal'
Plugin 'edkolev/tmuxline.vim'
let g:tmuxline_powerline_separators = 0

" - Misc
Plugin 'lukaszkorecki/workflowish'
Plugin 'mnick/vim-pomodoro'

call vundle#end()


" Preferences
filetype on
filetype plugin on
filetype indent on
syntax on
set smartindent
set hidden            " Useful for auto setting hidden buffers
set nostartofline     " Don't reset cursor to start of line when moving around
set whichwrap+=<,>,h,l,[,] " Wrap over end-of-line to next
set ttyfast

set ffs=unix,dos,mac

set modelines=1
set clipboard^=unnamed " Use system clipboard

" No backup file or undo file (git, Yankring take care of that)
set nobackup
set noswapfile
set noundofile

"if has('mouse')
  "set ttymouse=xterm2
  "set mouse=a
"endif

" #Searching/Moving
set gdefault   " Add the g flag to search/replace by default
set hlsearch
set ignorecase " Ignore case when searching
set smartcase  " Try and be smart about cases
set magic
nnoremap // :nohlsearch<cr>

set iskeyword+=_

nnoremap j gj
nnoremap k gk

" nnoremap <CR> G
" nnoremap <BS> gg

" I spend stupid amounts of time scrolling up and down with C-U and C-D
nnoremap <down> <C-d>
nnoremap <up> <C-u>

" #Appearance
set number " Always show line numbers
set scrolloff=7
set tabstop=2 softtabstop=2 shiftwidth=2 " Default tab stops
set expandtab
set autoindent
set smartindent
if exists('+breakindent')
  set breakindent
  let &showbreak = '↳ '
  let &breakat = " \t;:,])}"
  set cpo+=n
endif
set showcmd    " Shows incomplete command
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500
set splitbelow " New window goes below
set splitright " New windows goes right
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*
set wildmode=longest:full,full
set cursorline                      " Highlight current line
set t_Co=256                        " Explicitly tell Vim that the terminal supports 256 colors
set foldlevel=99    "File unfolded, always - use zM to close

colorscheme ron
set background=dark
" To keep styles after post-edit sourcing .vimrc
silent do ColorScheme


" #General (plugin-nonspecific) Auto Commands
" Get autocompletion for filetypes
set omnifunc=syntaxcomplete#Complete
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

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
augroup END

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
        \ call litecorrect#init() |
        \ call lexical#init()
augroup END

augroup except_help
  autocmd!
  autocmd FileType help setl nospell
  autocmd FileType help nnoremap <buffer> q :q<CR>
augroup END

" #Mappings
let mapleader ="\<Space>"
inoremap jj <ESC>
" Cribbed from @marcgg -- quick switch to previous file
nnoremap <space><space> :e#<CR>

" Trying out for size, thanks to Clever-f
noremap ; :

" Quick-saving/exiting shortcuts
" TODO: Sane work with buffers could be nice, especially with airline's
" buffer list. Set it up perhaps so that `fq` kills the buffer (:bd!), and
" closes vim if this is the last buffer open? (Alternatively, I can just keep
" doing what I do -- CtrlP/fzf to the other buffer I want, & get it in split
" if need be.)
nmap <leader>w :w!<cr>
nmap <leader>x :x!<cr>
nmap <leader>q :q!<cr>
command! W w !sudo tee % > /dev/null

" Undone because I had set it when I didn't use `f` very much
" nmap fq :q!<CR>
" nmap fw :w!<cr>
nnoremap fw <nop>
nnoremap fq <nop>

" Yank to end of line with Y
nnoremap Y y$

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Remove F1 and Q mappings
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap Q <nop>

" Edit various important files
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>ez :tabedit ~/.zshrc<cr>
nnoremap <leader>es :tabedit ~/.vim/bundle/vim-snippets/snippets<CR>
nnoremap <leader>et :tabedit ~/.tmux/tmux.conf

" #Functions
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
" Remove whitespace on save (cribbed from @marcgg)
autocmd! BufWritePre * call Preserve("%s/\\s\\+$//e")
nnoremap <leader>= :silent call Preserve("normal gg=G")<CR>

" Expression to help when I fucked up Markdown URL - assumes vim magic
function! FixMarkdownLinks()
  call Preserve("s/(\([^(]\{-}\))\[\(.\{-}\)\]/[\1](\2)")
endfunction

" Prune the arglist for matches
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  "       Building a hash ensures we get each buffer only once
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

" #Plugin settings and mappings
" Ack
nmap <Leader>a :Ack<space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Airline
set laststatus=2
let g:airline_theme = 'wombat'
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.whitespace = 'Ξ'

" Cosco - smart-add semicolons / commas
autocmd FileType javascript,css,php,matlab nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css,php,matlab inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" CSV
let g:csv_autocmd_arrange = 1

" CtrlP
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>f :CtrlPMixed<CR>
"nnoremap <C-[> :pop<CR>
"This map causes arrows to activate OA,OB,OC,OD -- unclear why? Perhaps
"because it's ^[?

let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_working_path_mode = 2 " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Dirvish
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
nnoremap <C-w>S :split<CR>:Dirvish<CR>
nnoremap <C-w>V :vsplit<CR>:Dirvish<CR>
nnoremap <Leader>S :split<CR>:Dirvish<CR>
nnoremap <Leader>V :vsplit<CR>:Dirvish<CR>
" nnoremap <Leader>n :20vsplit<CR>:Dirvish<CR>
nnoremap <leader>n :call ToggleDirvishSidebar()<CR>

" TODO: Clean up, re-make into a plugin
" Inspiration for toggling:
" http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
" Inspiration for tab-wide variable: NERDTree
function! ToggleDirvishSidebar()
    if (exists("t:dirvish_sidebar") && t:dirvish_sidebar == 1)
        let t:dirvish_sidebar = 0
        execute t:dirvish_window . "quit"
        execute t:dirvish_calling_window . "wincmd w"
    else
        let t:dirvish_sidebar = 1
        let t:dirvish_calling_window = winnr()
        :20vsplit
        let t:dirvish_window = winnr()
        Dirvish
        autocmd BufWinLeave <buffer> let t:dirvish_sidebar = 0
        " Ugly: push Dirvish-defined `p`, then call self
        nmap <buffer> o p:call ToggleDirvishSidebar()<CR>
        " TODO: Might actually have to grab the lines from dirvish/ftplugin,
        " since I can't redefine the mappings recursively (and it's ugly /
        " dangerous to do so)
    endif
endfunction

" Ditto
nmap <leader>di <Plug>ToggleDitto      " Turn it on and off

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches"]

" Dokumentary
let g:dokumentary_docprgs = {'ruby': 'ri --no-pager {0} | col -b'}
" Easy-motion
"let g:EasyMotion_leader_key = '<Leader>'

" EasyTag
set tags=./tags
let g:easytags_async = 1
" let g:easytags_dynamic_files = 2
let g:easytags_by_filetype = '~/.cache/tags'
"let g:easytags_syntax_keyword = 'always'

" Emmet
let g:user_emmet_leader_key = '<c-e>'

" EnhancedJumps
let g:EnhancedJumps_CaptureJumpMessages = 0

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

" Gist
let g:gist_post_private = 1
vmap <leader>gS :'<,'>Gist<CR>
nmap <leader>gS :Gist<CR>
nmap <leader>gSb :Gist -m<CR>

" Gundo
" TODO: Crouton vim is compiled without sufficient Python version
nmap <leader>u :GundoToggle<CR>
let g:gundo_right = 1

" ListToggle (*v*iew list)
let g:lt_location_list_toggle_map = '<leader>vl'
let g:lt_quickfix_list_toggle_map = '<leader>vq'

" Markdown
let g:vim_markdown_initial_foldlevel=1
let g:vim_markdown_conceal=1
" FIXME: in iTerm2 / tmux, vim doesn't delete the *space* that MD link
" URLs have, even though it hides them from view? To investigate further


" Make / vim-dispatch
nmap <Leader>m :Dispatch<CR>
nmap <Leader>M :Dispatch!<CR>

" Merginal
nmap <leader>gm :MerginalToggle<CR>

" NerdCommenter / Commentary (maps <C-/>)
"map <C-_> <Plug>NERDCommenterToggle
map <C-_> :Commentary<CR>

" Pencil
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

" Rainbow Parens
"nmap <leader>r :RainbowParentheses!!<CR>

" Snipmate
" imap <C-J> <Plug>snipMateNextOrTrigger
" smap <C-J> <Plug>snipMateNextOrTrigger
" PHP Snipmate only inserts php
"let g:snipMate = {}
"let g:snipMate.scope_aliases['php'] = 'php'

" Syntastic
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#show_message = 0
"let g:syntastic_quiet_messages = { "type": "style"  }
"let g:syntastic_stl_format = "[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]"

" TaskList ("view tasks")
nmap <Leader>vt <Plug>TaskList
" Markdown
let g:vim_markdown_folding_disabled=1

" Goyo
nmap <leader>g :Goyo<CR>

" Disable tmux on enter for Goyo
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

" Sneak
let g:sneak#streak = 1

" Stencil
let g:StencilTemplatepath = "~/.vim/templates/"

" SuperTab
let g:SuperTabDefaultCompletionType = 'context'
autocmd FileType *
      \ if &omnifunc != '' |
      \   call SuperTabChain(&omnifunc, "<c-p>") |
      \ endif

" #Unimpaired
" Add a line without changing position or leaving mode: ]<Space> and [<Space>
" Toggle paste while starting insert: yo/yO
" Toggle spell: cos
" Toggle hlsearch: coh

" Vimux (although don't forget about vim-ipython)
autocmd FileType python nnoremap <buffer> <leader>vr :call VimuxRunCommand("ipython console")
autocmd FileType r nnoremap <buffer> <leader>vr :call VimuxRunCommand("R")
autocmd FileType ruby nnoremap <buffer> <leader>vr :call VimuxRunCommand("pry")
autocmd FileType matlab nnoremap <buffer> <leader>vr :call VimuxRunCommand("matlab -nodesktop -nodisplay -nosplash")

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

" Specific MATLAB-debugging bindings (assuming an open Vimux pane)
augroup matlab_debug
  autocmd!
  autocmd FileType matlab nnoremap <buffer> <localleader>d :call VimuxSendText("dbstop in " . expand('%:t') . " at " . line(".") . "\n")<CR> |
        \ nnoremap <buffer> <localleader>s :call VimuxSendText("dbstep\n")<CR> |
        \ nnoremap <buffer> <localleader>c :call VimuxSendText("dbcont\n")<CR> |
        \ nnoremap <buffer> <localleader>r :call VimuxSendText("dbclear all\n")<CR> |
        \ nnoremap <buffer> <localleader>q :call VimuxSendText("dbquit\n")<CR> |
        \ nnoremap <buffer> <localleader>i :call VimuxSendText("dbstep in\n")<CR> |
        \ nnoremap <buffer> <localleader>o :call VimuxSendText("dbstep out\n")<CR> |
        \ nnoremap <buffer> <localleader>p :call VimuxSendText("PsychDebugWindowConfiguration\n")<CR> |
        \ nnoremap <buffer> <leader>vb :call VimuxSendText("cd('" . expand('%:p:h') . "');\n" . expand('%:t:r') . "\n")<CR> |
        \ inoremap <buffer> .. ...<CR>
augroup END

" Single-project bindings
augroup matlab_ptb
  autocmd!
  autocmd BufNewFile,BufRead ~/Coding/RNA_PTB_task/*
        \ nnoremap <buffer> <leader>vr :call VimuxRunCommand("matlab -nodesktop -nosplash")<CR> |
        \ nnoremap <buffer> <leader>v :call VimuxSendText(expand("%:t:r") . "(2)\n")<CR>:map 1 <nop><CR>:map 2 <nop><CR>:map 5 <nop><CR> |
        \ nnoremap <buffer> <leader>b :call VimuxSendText("sca\n")<CR>:unmap 1<CR>:unmap 2<CR>:unmap 5<CR> |
        \ nnoremap <buffer> <leader>rm :FocusDispatch matlab -nodesktop -nosplash -r 'PsychDebugWindowConfiguration;MDM;quit;'<CR>:Dispatch!<CR> |
        \ nnoremap <buffer> <leader>RM :FocusDispatch matlab -nodesktop -nosplash -r 'PsychDebugWindowConfiguration;MDM(2);quit;'<CR>:Dispatch!<CR> |
        \ nnoremap <buffer> <leader>rr :FocusDispatch matlab -nodesktop -nosplash -r 'PsychDebugWindowConfiguration;RA;quit;'<CR>:Dispatch!<CR> |
        \ nnoremap <buffer> <leader>RR :FocusDispatch matlab -nodesktop -nosplash -r 'PsychDebugWindowConfiguration;RA(2);quit;'<CR>:Dispatch!<CR> |
augroup END

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

" VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" YankStack
" To protect vim-surround, because ugh
call yankstack#setup()
nmap Y y$

nnoremap <leader>p <Plug>yankstack_substitute_older_paste
nnoremap <leader>P :Yanks<CR>
