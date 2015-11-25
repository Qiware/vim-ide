" ============================================================================
" File:        Niu_HiWord.vim
" Description: highlight the words which user specified.
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
if exists("g_has_hiword_loaded")
    finish
endif

let g_has_hiword_loaded = 1

hi HIWORD term=standout ctermfg=1 ctermbg=3 guifg=Blue guibg=Yellow

let s:HiWordDic = {}

function Niu_HiWord()
    let l:word = expand("<cword>")

    if has_key(s:HiWordDic, l:word)
        let l:id = s:HiWordDic[l:word]
        call remove(s:HiWordDic, l:word)
        call matchdelete(l:id)
    else
        let s:HiWordDic[l:word] = matchadd("HIWORD", '\<' . l:word . '\>')
    endif
endfunction

function Niu_ClearHiWord()
    let s:HiWordDic = {}
    call clearmatches()

    call matchadd("HIWORD", "FIXME:.*")
    call matchadd("HIWORD", "TODO:.*")
endfunction
call Niu_ClearHiWord()

nmap <S-F8> :call Niu_HiWord()<CR>
nmap <S-F9> :call Niu_ClearHiWord()<CR>
