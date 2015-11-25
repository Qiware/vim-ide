" ============================================================================
" File:        Niu_StatusBar.vim
" Description: powerful status bar
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
if exists("loaded_niu_statusbar")
    finish
endif

let loaded_niu_statusbar = 1

function Niu_StatusBar()
    hi User1 ctermfg=Black ctermbg=White guifg=Black guibg=White
    hi User2 ctermfg=White ctermbg=Red guifg=White guibg=Red
    hi User3 ctermfg=White ctermbg=Blue guifg=White guibg=Blue
    hi User4 ctermfg=White ctermbg=Green guifg=White guibg=Green
    hi User5 ctermfg=Black ctermbg=Yellow guifg=Black guibg=Yellow
    hi User6 ctermfg=White ctermbg=Cyan guifg=White guibg=Cyan
    
    set laststatus=2

    set statusline=
    set statusline+=%#User1#%<%-10F " filename
    set statusline+=%#User2#%m%r%h%w " flags
    set statusline+=%#User3#\ %{&ff},%{&fenc!=''?&fenc:&enc}\  " fileformat,fileencoding,encoding
    set statusline+=%#User4#\ %y " filetype
    set statusline+=%#User4#\ %= "right align
    set statusline+=%#User5#\ CODE:[%03b=0x%04B]\  " fileformat,fileencoding,encoding
    set statusline+=%#User6#\ POS:[%l/%L,%v/\ %p%%]\ " position
    set statusline+=%#User7#\ TIME:[%{strftime(\"%Y-%d-%m\ %H:%M\")}]\  "datetime
endfunction

au VimEnter,ColorScheme * call Niu_StatusBar()
