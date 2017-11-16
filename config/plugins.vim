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
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
" TODO: Investigate MATLAB not closing `end`?
Plugin 'rhysd/clever-f.vim'
Plugin 'tpope/vim-eunuch'

" Usability improvements
Plugin 'tpope/vim-dispatch'
" TODO: Gracefully degrade mapping
Plugin 'Valloric/ListToggle'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'vim-scripts/EnhancedJumps'
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
" Plugin 'justinmk/vim-dirvish'
Plugin 'ludovicchabant/vim-gutentags'
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
Plugin 'tmux-plugins/vim-tmux-focus-events'
" TODO: Figure out use case of tbone vs. vimux

" General coding
" Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
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
let g:pandoc#filetypes#pandoc_markdown = 0

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

" Experimental / barely used
" - Better vim
Plugin 'tpope/vim-abolish'
Plugin 'mjbrownie/swapit'
Plugin 'wellle/targets.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'reedes/vim-one'
Plugin 'sheerun/vim-polyglot'
Plugin 'rickhowe/diffchar.vim'
Plugin 'will133/vim-dirdiff'
" Better multifile search
" Plugin 'wincent/ferret'

" - Alignment
" Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-easy-align'
" Plugin 'tommcdo/vim-lion'

" - Yanking and undo
" Plugin 'vim-scripts/YankRing.vim'
Plugin 'maxbrunsfeld/vim-yankstack'

" - Writing tools
" Plugin 'reedes/vim-wordy'

" - Refactoring / easier code writing
" Plugin 'mattn/emmet-vim'
Plugin 'lfilho/cosco.vim'
if has("unix")
  Plugin 'tpope/vim-dotenv'
endif
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Chiel92/vim-autoformat'
" TODO: Install formatters for Octave, Ruby, Python

" - External services
Plugin 'jaxbot/browserlink.vim'
Plugin 'wellle/tmux-complete.vim'

" - Visual
Plugin 'idanarye/vim-merginal'
" Plugin 'edkolev/tmuxline.vim'
" let g:tmuxline_powerline_separators = 0

" - Misc


