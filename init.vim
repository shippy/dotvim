" The smart way to do this would be to determine default path based on system,
" then append it.
"
" Either way, this goes in $XDG_CONFIG/nvim or AppData/Local/nvim.

set runtimepath^=~/vimfiles runtimepath+=~/vimfiles/after
let &packpath=&runtimepath
source ~/vimfiles/vimrc
