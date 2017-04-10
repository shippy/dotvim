if has('gui')
  if has("gui_macvim")
    set guioptions-=r "remove scrollbars
    set guioptions-=R "remove scrollbars
    set guioptions-=l "remove scrollbars
    set guioptions-=L "remove scrollbars
    set guioptions-=T " Remove toolbars
    let macvim_skip_colorscheme = 1
    set transparency=0
    set fuoptions=maxvert,maxhorz
    set guifont=Menlo:h14
    set nolazyredraw
    " Change to `1` if your font is patched with webdev icons.
    let g:webdevicons_enable = 0
    set linespace=0
    colorscheme darkblue
  endif
endif
