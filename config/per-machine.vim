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
