" Minimal example of Vundle bug
set nocompatible
filetype off

let $VIMHOME = $HOME."/.vim"
set runtimepath+=$VIMHOME/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()
