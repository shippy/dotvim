" Simon Podhajsky's vimrc
" Initial inspiration and form taken from Evan Dancer's .vimrc
" Re-organization inspired by @rlue

" TODO: This structuring of plugin settings - each in a file, the files
" programmatically sourced from folder - is appealing
" https://github.com/skwp/dotfiles/blob/master/vim/settings.vim
set nocompatible
filetype off

" Define $VIMHOME, others
source config/per-machine.vim

set runtimepath+=$VIMHOME/bundle/Vundle.vim
call vundle#begin()
Plugin 'shippy/Vundle.vim'
source config/plugins.vim
call vundle#end()

" Preferences
source config/base.vim
source config/plugin-config.vim

" #Mappings
source config/functions.vim
source config/mappings.vim
source config/autocmds.vim
