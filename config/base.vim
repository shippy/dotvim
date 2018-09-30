filetype on
filetype plugin on
filetype indent on
syntax on
set hidden            " Useful for auto setting hidden buffers
set nostartofline     " Don't reset cursor to start of line when moving around
set whichwrap+=<,>,h,l,[,] " Wrap over end-of-line to next
set ttyfast

set ffs=unix,dos,mac

set modelines=1
set clipboard^=unnamed " Use system clipboard

" Set up undo, swap, and backup directories (in that order of priority)
" ^= adds the value to the front of the list, += appends to the end
if has('persistent_undo')
  set undofile
  set undolevels=10000
  set undoreload=20000
  if isdirectory($VIMHOME . '/undodir')
    set undodir^=$VIMHOME/undodir//
  endif
endif

set directory^=$VIMHOME/swapdir//

if isdirectory($VIMHOME . '/bckpdir')
  set backup
  set backupdir^=$VIMHOME/bckpdir//
else
  set nobackup
endif

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
set listchars=tab:>-,trail:·
set list
set expandtab
set smarttab
set autoindent
" set smartindent
" To stop messing up hash comment indentation
" See: http://vim.wikia.com/wiki/Restoring_indent_after_typing_hash
set nosmartindent
set cindent
set cinkeys-=0#
set indentkeys-=0#
if has("linebreak")
  try
    set breakindent
    let &showbreak = '↳ '
    let &breakat = " \t;:,])}"
    set cpo+=n
  catch /E518:/
    " Unknown option: breakindent
  endtry
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
" Make the highlight light-grey without resetting syntax highlighting (rather
" than an underline)
set t_Co=256                        " Explicitly tell Vim that the terminal supports 256 colors

" Folding
set foldenable
set foldmethod=indent
" set foldlevel=99    "File unfolded, always - use zM to close

colorscheme ron
set background=dark
" To keep styles after post-edit sourcing .vimrc
silent do ColorScheme
" This line must follow background setting + redraw, otherwise it won't stick
hi CursorLine cterm=NONE ctermbg=8 ctermfg=NONE

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
