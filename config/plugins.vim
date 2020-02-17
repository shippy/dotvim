" @tpope plugins
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
" TODO: Have a cheatsheet
Plugin 'tpope/vim-repeat'
" TODO: Make sure I know how it works

" Essential usage
" Replacing CtrlP with fzf
" Plugin 'ctrlpvim/ctrlp.vim' 
Plugin 'mileszs/ack.vim'
" Two above: Make sure that SilverSearcher is used
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'ajh17/VimCompletesMe'
" Plugin 'ervandew/supertab'
" TODO: Complement with a better completion plugin
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-rsi'
" TODO: Condition on existence of wiki folder
if isdirectory($HOME . "/vimwiki")
  Plugin 'vimwiki/vimwiki'
endif
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rhysd/clever-f.vim'
Plugin 'tpope/vim-eunuch'
" Insert 'end' keyword where appropriate (bash, zsh, Ruby, vim, Matlab, ...)
" TODO: Investigate MATLAB not closing `end`?
Plugin 'tpope/vim-endwise'

" Usability improvements
if g:fzf_exists
  Plugin 'junegunn/fzf.vim'
else
  " fzf alternative on windows
  Plugin 'Yggdroot/LeaderF'
endif
Plugin 'tpope/vim-dispatch'
" TODO: Gracefully degrade mapping
Plugin 'Valloric/ListToggle'
Plugin 'vim-scripts/TaskList.vim'
" Plugin 'justinmk/vim-sneak'
Plugin 'vim-scripts/EnhancedJumps'
Plugin 'tpope/vim-obsession'
if has("unix")
  Plugin 'dhruvasagar/vim-prosession'
  " FIXME: No workflow around these -> might as well skip it for now
  " Plugin 'ludovicchabant/vim-gutentags'
endif
" Plugin 'justinmk/vim-dirvish'
Plugin 'tpope/vim-sleuth'
" Plugin 'easymotion/vim-easymotion'
" Plugin 'yangmillstheory/vim-snipe'
" Unclear if this provides any tangible benefit
Plugin 'wincent/terminus'
if has("unix") && !has("macunix")
  let g:TerminusCursorShape=0
endif

" Visual
Plugin 'itchyny/lightline.vim'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/rainbow_parentheses.vim'

" Tmux interaction
" Interact with the tmux executable directly
Plugin 'tpope/vim-tbone'
" Get tmux.conf highlighting
Plugin 'tmux-plugins/vim-tmux'
" Get a REPL
Plugin 'benmills/vimux'
" Get simple C-hjkl movement between panes and splits (requires addition to
" tmux.conf, see README)
Plugin 'christoomey/vim-tmux-navigator'
" Allow FocusGained and FocusLost autocommands to work in terminal vim
Plugin 'tmux-plugins/vim-tmux-focus-events'

" General coding
" Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'

" Language-specific
" Plugin 'plasticboy/vim-markdown'
" Plugin 'vim-pandoc/vim-rmarkdown'
" Plugin 'gabrielelana/vim-markdown'
" Plugin 'vim-ruby/vim-ruby'
" Plugin 'StanAngeloff/php.vim'
" Plugin 'lervag/vimtex'
" Plugin 'ivanov/vim-ipython'
" Plugin 'chrisbra/csv.vim'
" TODO for R: https://github.com/jalvesaq/Nvim-R,
" Plugin 'vim-pandoc/vim-pandoc'
" let g:pandoc#filetypes#pandoc_markdown = 0

" Plugin 'vim-scripts/MatlabFilesEdition'

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
" Allows for advanced spellcheck, including a thesaurus
" Plugin 'reedes/vim-lexical'
Plugin 'reedes/vim-litecorrect'

" Text objects
" Plugin 'rbonvall/vim-textobj-latex'
Plugin 'beloglazov/vim-textobj-punctuation'

" Prerequisites
" Required for any custom text bojects (like -sentence or -punctation)
Plugin 'kana/vim-textobj-user'
" Required for vim-snipmate
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
" Required for EnhancedJumps
" Plugin 'vim-scripts/Vimball'
Plugin 'vim-scripts/ingo-library'
" Plugin 'xolox/vim-misc'

" Experimental / barely used
" - Better vim
Plugin 'tpope/vim-abolish'
" Plugin 'mjbrownie/swapit'
Plugin 'wellle/targets.vim'
" Plugin 'reedes/vim-one'
Plugin 'sheerun/vim-polyglot'
Plugin 'rickhowe/diffchar.vim'
" Plugin 'will133/vim-dirdiff'
" Better multifile search
" Plugin 'wincent/ferret'

" - Alignment
" Plugin 'godlygeek/tabular'
" Plugin 'junegunn/vim-easy-align'
" Plugin 'tommcdo/vim-lion'

" - Yanking and undo
" Plugin 'vim-scripts/YankRing.vim'
Plugin 'maxbrunsfeld/vim-yankstack'

" - Writing tools
" Plugin 'reedes/vim-wordy'

" - Refactoring / easier code writing
" Plugin 'mattn/emmet-vim'
" Plugin 'lfilho/cosco.vim'
" if has("unix")
"   Plugin 'tpope/vim-dotenv'
" endif

" Converts one-liners into multi-liners and vice versa with gS and gJ. TODO: Test on Python.
Plugin 'AndrewRadev/splitjoin.vim'

" Allows simple autoformatting, assuming formatters are available
Plugin 'Chiel92/vim-autoformat'
" TODO: Install formatters for Octave, Ruby, Python

" - External services
" In theory, autocomplete from adjacent tmux panes, but might require async
Plugin 'wellle/tmux-complete.vim'

" - Visual
" Plugin 'idanarye/vim-merginal'
