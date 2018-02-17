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
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' [' . tab . '] '.bmod
  endfor

  let s .= '%#TabLineFill#'
  return s
endfunction
set tabline=%!MCTab()
