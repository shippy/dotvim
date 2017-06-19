" Word count in LaTeX
function! LatexWordCount()
  let filename = expand("%")
  " TODO: Escape `filename`
  let cmd = "detex " . filename . " | wc -w | xargs | tr -d '\n'"
  let result = system(cmd) . " words"
  echo result
endfunction

" Remove whitespace on save (cribbed from @marcgg)
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Expression to help when I fucked up Markdown URL - assumes vim magic
function! FixMarkdownLinks()
  call Preserve("s/(\([^(]\{-}\))\[\(.\{-}\)\]/[\1](\2)")
endfunction

" Prune the arglist for matches
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  "       Building a hash ensures we get each buffer only once
  let buffer_numbers = { }
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expantab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction
