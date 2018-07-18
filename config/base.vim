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
set undodir^=$VIMHOME/undodir//
" set backupdir^=$VIMHOME/.backup//
set directory=$VIMHOME/swapdir//
set nobackup

if has('mouse')
  set ttymouse=xterm2
  set mouse=a
endif

" #Searching/Moving
set gdefault   " Add the g flag to search/replace by default
set magic      " Fewer escaping needed in search
set ignorecase " Ignore case when searching
" set smartcase  " Don't ignore case when there's at least one upper-case character
" (turned off because Dragon Professional Individual occasionally upper-cases
" word recognitions capriciously)
set hlsearch

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

" Folding
set foldenable
set foldmethod=indent
" set foldlevel=99    "File unfolded, always - use zM to close

colorscheme ron
set background=dark
" To keep styles after post-edit sourcing .vimrc
silent do ColorScheme

set title
" set titlestring=vim\ -\ %t%(\ %M%)%(\ (%{expand(\"%:h\")})%)%(\ %a%)
set titlestring=vim
" Disable 'Thanks for flying vim'
let &titleold=getcwd()

" Tmux tweaks from
" http://tangosource.com/blog/a-tmux-crash-course-tips-and-tweaks/
" Fix cursor in tmux
" if exists('$ITERM_PROFILE')
"   if exists('$TMUX') 
"     let &t_SI = "\<Esc>[3 q"
"     let &t_EI = "\<Esc>[0 q"
"   else
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"   endif
" end

if exists('$TMUX')
  let &t_SI = "\ePtmux;\e\e[5 q\e\\"
  let &t_EI = "\ePtmux;\e\e[2 q\e\\"
else
  let &t_SI = "\e[5 q"
  let &t_EI = "\e[2 q"
endif

" for tmux to automatically set paste and nopaste mode at the time pasting (as
" happens in VIM UI)
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

" let &t_SI .= WrapForTmux("\<Esc>[?2004h")
" let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" Saner joins (courtesy of https://kinbiko.com/vim/my-shiniest-vim-gems/)
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif
