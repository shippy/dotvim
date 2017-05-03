if has('gui')
  if has("gui_macvim")
    set transparency=0
    set fuoptions=maxvert,maxhorz
    set guifont=Menlo\ Regular:h14
    set nolazyredraw
    " Change to `1` if your font is patched with webdev icons.
    let g:webdevicons_enable = 0
    set linespace=0
  else
    set guifont=DejaVu_Sans_Mono_for_Powerline:h11,Anonymice_Powerline:h13,Consolas:h13,Lucida\ Console:h13
    map <C-z> <Esc>u
  endif

  " Universal options
  set guioptions-=r "remove scrollbars
  set guioptions-=T " Remove toolbars
  set guioptions-=R "remove scrollbars
  set guioptions-=l "remove scrollbars
  set guioptions-=L "remove scrollbars
  colorscheme jellybeans
endif
