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
set titlestring=vim\ -\ %t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)
" Disable 'Thanks for flying vim'
let &titleold=getcwd()
