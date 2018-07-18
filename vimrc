" Simon Podhajsky's vimrc
" Initial inspiration and form taken from Evan Dancer's .vimrc
" Re-organization inspired by @rlue

" TODO: This structuring of plugin settings - each in a file, the files
" programmatically sourced from folder - is appealing
" https://github.com/skwp/dotfiles/blob/master/vim/settings.vim

set nocompatible
filetype off

" Copied verbatim from @rlue/.vim
let g:vim_home = expand('<sfile>:p:h') . '/'
let $MYVIMRC   = g:vim_home . 'vimrc'
let $MYGVIMRC  = g:vim_home . 'gvimrc'

" Define machine-specific things
exec 'source ' . g:vim_home . 'config/per-machine.vim'

set runtimepath+=$VIMHOME/bundle/Vundle.vim
set runtimepath+=/usr/local/opt/fzf
call vundle#begin()
Plugin 'shippy/Vundle.vim'
exec 'source ' . g:vim_home . 'config/plugins.vim'
call vundle#end()

exec 'source ' . g:vim_home . 'config/base.vim'
exec 'source ' . g:vim_home . 'config/plugin-config.vim'
exec 'source ' . g:vim_home . 'config/functions.vim'
exec 'source ' . g:vim_home . 'config/mappings.vim'
exec 'source ' . g:vim_home . 'config/autocmds.vim'
