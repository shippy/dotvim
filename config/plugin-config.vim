" To protect vim-surround and sneak, called early
call yankstack#setup()

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Airline
set laststatus=2
let g:airline_theme = 'wombat'
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 0
if has("win32unix") || has("win32") || has ('win64')
  let g:airline_powerline_fonts = 1
else
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.whitespace = 'Ξ'
endif

" Autopairs
" let g:AutoPairsShortcutToggle = ''

" CSV
let g:csv_autocmd_arrange = 1

" CtrlP
let loaded_ctrlp = 1
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_working_path_mode = 2 " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag -i --nocolor --nogroup --hidden -g "" %s'
  " see https://github.com/kien/ctrlp.vim/issues/665
elseif (has("win32") || has("win64") || has("win95") || has("win16"))
  let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
endif

" Dirvish / netrw
" let g:loaded_netrw = 1
" let g:loaded_netrwPlugin = 1

" Easy-motion
let g:EasyMotion_leader_key = '<LocalLeader>'

" Emmet
let g:user_emmet_leader_key = '<c-e>'

" EnhancedJumps
let g:EnhancedJumps_CaptureJumpMessages = 0

" Markdown
let g:vim_markdown_initial_foldlevel=1
let g:vim_markdown_conceal=1
" FIXME: in iTerm2 / tmux, vim doesn't delete the *space* that MD link
" URLs have, even though it hides them from view? To investigate further

" Pencil
let g:pencil#wrapModeDefault = 'soft'

let g:pencil#autoformat_blacklist = [
      \ 'markdownCode',
      \ 'markdownUrl',
      \ 'markdownIdDeclaration',
      \ 'markdownLinkDelimiter',
      \ 'markdownHighlight[A-Za-z0-9]+',
      \ 'mkdCode',
      \ 'mkdIndentCode',
      \ 'markdownFencedCodeBlock',
      \ 'markdownInlineCode',
      \ 'mmdTable[A-Za-z0-9]*',
      \ 'txtCode',
      \ 'texAbstract',
      \ 'texBeginEndName',
      \ 'texDelimiter',
      \ 'texDocType',
      \ 'texInputFile',
      \ 'texMath',
      \ 'texRefZone',
      \ 'texSection$',
      \ 'texStatement',
      \ 'texTitle',
      \ ]

" crosh makes a mess of unicode -> disable concealment
let g:tex_conceal='b'

" PHP Snipmate only inserts php
"let g:snipMate = {}
"let g:snipMate.scope_aliases['php'] = 'php'

" Syntastic
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#show_message = 0
let g:syntastic_quiet_messages = { "type": "style"  }
let g:syntastic_python_pylint_quiet_messages = { "level" : "warnings" }
"let g:syntastic_stl_format = "[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]"

" Markdown
let g:vim_markdown_folding_disabled=1

" Goyo
" Disable tmux on enter for Goyo
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Sneak
let g:sneak#streak = 1

" SuperTab
let g:SuperTabDefaultCompletionType = 'context'
autocmd FileType *
      \ if &omnifunc != '' |
      \   call SuperTabChain(&omnifunc, "<c-p>") |
      \ endif

" Vimux (although don't forget about vim-ipython)
let g:VimuxUseNearest = 1

" Specify prompt commands
autocmd FileType python nnoremap <buffer> <leader>vr :call VimuxRunCommand("ipython console")
autocmd FileType r nnoremap <buffer> <leader>vr :call VimuxRunCommand("R")
autocmd FileType ruby nnoremap <buffer> <leader>vr :call VimuxRunCommand("pry")
autocmd FileType matlab nnoremap <buffer> <leader>vr :call VimuxRunCommand("matlab -nodesktop -nodisplay -nosplash")

" Specific MATLAB-debugging bindings (assuming an open Vimux pane)
augroup matlab_debug
  autocmd!
  autocmd FileType matlab nnoremap <buffer> <localleader>d :call VimuxSendText("dbstop in " . expand('%:t') . " at " . line(".") . "\n")<CR> |
        \ nnoremap <buffer> <localleader>s :call VimuxSendText("dbstep\n")<CR> |
        \ nnoremap <buffer> <localleader>c :call VimuxSendText("dbcont\n")<CR> |
        \ nnoremap <buffer> <localleader>r :call VimuxSendText("dbclear all\n")<CR> |
        \ nnoremap <buffer> <localleader>q :call VimuxSendText("dbquit\n")<CR> |
        \ nnoremap <buffer> <localleader>i :call VimuxSendText("dbstep in\n")<CR> |
        \ nnoremap <buffer> <localleader>o :call VimuxSendText("dbstep out\n")<CR> |
        \ nnoremap <buffer> <localleader>p :call VimuxSendText("PsychDebugWindowConfiguration\n")<CR> |
        \ nnoremap <buffer> <leader>vb :call VimuxSendText("cd('" . expand('%:p:h') . "');\n" . expand('%:t:r') . "\n")<CR> |
        \ inoremap <buffer> .. ...<CR>
augroup END

" Single-project bindings
augroup matlab_ptb
  autocmd!
  autocmd BufNewFile,BufRead ~/Coding/PsychTaskFramework/*
        \ nnoremap <buffer> <leader>vr :call VimuxRunCommand("matlab -nodesktop -nosplash")<CR> |
        \ nnoremap <buffer> <leader>vx :call VimuxSendText("sca\n")<CR>
augroup END

" VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
let g:vimwiki_dir_link = 'index'
" disable the <tab> mapping provided by vimwiki, which interferes with SuperTab (per vimwiki#148)
let g:vimwiki_table_mappings = 0
let g:vimwiki_auto_chdir = 1
