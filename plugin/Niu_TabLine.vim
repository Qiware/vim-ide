" ============================================================================
" File:        Niu_TabLine.vim
" Description: customed Tab Line
" Author:  Niu Chenguang <chrisniu1984@gmail.com>
" Version:  1.0
" Last Change: 2013-09-13
" License: GPL3
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <http://www.gnu.org/licenses/>.
" ============================================================================

" Do not load this file if is has already been loaded.
if exists("loaded_niu_tabline")
    finish
endif

let loaded_niu_tabline = 1

hi Tab      ctermfg=Black ctermbg=White guifg=Black guibg=White
hi TabSel   ctermfg=White ctermbg=Blue guifg=White guibg=Blue

function! Niu_TabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    let n = i + 1
    if n == tabpagenr()
      let s .= '%#TabSel#'
    else
      let s .= '%#Tab#'
    endif

    " set the tab page number (for mouse clicks)
    " let s .= '%' . n . 'T'

    let buflist = tabpagebuflist(n)
    let winnr = tabpagewinnr(n)
    let filename = bufname(buflist[winnr - 1])
    let filename = fnamemodify (filename, ':t')
    let s .= " [".n."] ".filename." "
    endfor

  return s
endfunction

set tabline=%!Niu_TabLine()

