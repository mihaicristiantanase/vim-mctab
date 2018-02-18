"
" Show a minimal tabline
"
function! MCTab()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bmod = ''
    for bufnr in buflist
      let isbmod = getbufvar(bufnr, "&mod")
      if isbmod == 1
        let bmod = '+'
        break
      endif
    endfor

    let s .= '%' . tab . 'T'
    if tab == tabpagenr()
      let s .= '%#TabLineSel#%' . ' [' . tab . '] '
    else
      let s .= '%#TabLine#' . '  ' . tab . '  '
    endif
    let s .= bmod
  endfor

  let s .= '%#TabLineFill#'
  return s
endfunction
set tabline=%!MCTab()

"
" [Auto]Toggle tabline
" Requires vim 8+
"
if (exists('g:tablineToggleFunTimerId'))
  unlet g:tablineToggleFunTimerId
endif

function! TablineToggleAutoCloseStopFun()
  if (exists('g:tablineToggleFunTimerId'))
    call timer_stop(g:tablineToggleFunTimerId)
    unlet g:tablineToggleFunTimerId
  endif
endfunction

function! TablineToggleHideFun()
  se showtabline=0
  call TablineToggleAutoCloseStopFun()
endfunction

function! TablineToggleShowFun()
  se showtabline=2
  call TablineToggleAutoCloseStopFun()
  let g:tablineToggleFunTimerId = timer_start(2000, 'TablineToggleFun', {'repeat': 1})
endfunction

function! TablineToggleFun(...)
  if &showtabline == 0 || (&showtabline == 1 && tabpagenr('$') == 1)
    call TablineToggleShowFun()
  else
    call TablineToggleHideFun()
  endif
endfunction
nnoremap <silent> <F3> :call TablineToggleFun()<CR>
tnoremap <silent> <F3> <C-w>:call TablineToggleFun()<CR>

" if tabline is showing, do autoclose
if &showtabline == 2 || (&showtabline == 1 && tabpagenr('$') > 1)
  call TablineToggleShowFun()
endif
