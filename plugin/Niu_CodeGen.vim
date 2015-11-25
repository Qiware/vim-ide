" ============================================================================
" File:        Niu_CodeGen.vim
" Description: Generate some commonly used code (for c)
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
if exists("loaded_niu_codegen")
    finish
endif

let loaded_niu_codegen = 1


function Niu_CodeSplit()
    call append(line("."), "/*****************************************************************************/")
endfunction

function Niu_CodeInclude()
    let l:i = line(".")
    let l:i=l:i+1 | call append(l:i-1, "#include <stdio.h>")
    let l:i=l:i+1 | call append(l:i-1, "#include <stdlib.h>")
    let l:i=l:i+1 | call append(l:i-1, "#include <unistd.h>")
endfunction

function Niu_CodeMain()
    let l:i = line(".")
    let l:i=l:i+1 | call append(l:i-1, "int main(int argc, char **argv)")
    let l:i=l:i+1 | call append(l:i-1, "{")
    let l:i=l:i+1 | call append(l:i-1, "    ")
    let l:i=l:i+1 | call append(l:i-1, "    return 0;")
    let l:i=l:i+1 | call append(l:i-1, "}")

    let l:l = line(".")
    call cursor(l:l+3, 4)
endfunction

function Niu_CodeHeaderMacro()
    let l:macro = "__" . toupper(tr(expand("%:t"), ".", "_")) . "__"

    let l:i = 0
    call append(l:i, "#ifndef " . l:macro)  | let l:i=l:i+1
    call append(l:i, "#define " . l:macro)  | let l:i=l:i+1
    call append(l:i, "")                    | let l:i=l:i+1
    call append(l:i, "#ifdef __cplusplus")  | let l:i=l:i+1
    call append(l:i, "extern \"C\" {")      | let l:i=l:i+1
    call append(l:i, "#endif")              | let l:i=l:i+1
    call append(l:i, "")                    | let l:i=l:i+1

    call append(line("$"), "")
    call append(line("$"), "#ifdef __cplusplus")
    call append(line("$"), "}")
    call append(line("$"), "#endif")
    call append(line("$"), "")
    call append(line("$"), "#endif // " . l:macro)
endfunction

nmap ci     :call Niu_CodeInclude()<CR>
nmap cm     :call Niu_CodeMain()<CR>
nmap ch     :call Niu_CodeHeaderMacro()<CR>

