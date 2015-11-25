" ============================================================================
" File:        Niu_FileTypeOpt.vim
" Description: some customed options for different filetype (for me)
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
if exists("loaded_niu_ftopt")
    finish
endif

let loaded_niu_ftopt = 1

function Niu_FileTypeOpt()
    if &filetype == "make"
        set noexpandtab
    else
        set expandtab
    endif

    if &filetype == "html" || &filetype == "xml"
        set sw=2
        set ts=2
    else 
        set sw=4
        set ts=4
    endif
endfunction

au BufNewFile,BufRead * call Niu_FileTypeOpt()
