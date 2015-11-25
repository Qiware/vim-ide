" ============================================================================
" File:        DXS_CodeGen.vim
" Description: Generate some commonly used code
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
if exists("loaded_dxs_codegen")
    finish
endif
let loaded_dxs_codegen = 1

function Dxs_CodePython()
    let l:i = 0
    call append(l:i, "\#!/usr/bin/env python2")  | let l:i=l:i+1
    call append(l:i, "\# -*- coding: utf-8 -*-")  | let l:i=l:i+1
endfunction

function Dxs_CodeNote()
    let l:i = line(".")
    let l:i=l:i+0 | call append(l:i-1, "/*****************************************************************************")
    let l:i=l:i+1 | call append(l:i-1, " * FileName :     " . expand("%:t"))
    let l:i=l:i+1 | call append(l:i-1, " * Version :      3.5")
    let l:i=l:i+1 | call append(l:i-1, " * Author :       wang binya")
    let l:i=l:i+1 | call append(l:i-1, " * Email :        binya.wang@zznode.com")
    let l:i=l:i+1 | call append(l:i-1, " * Date :         " . strftime("%Y-%m-%d"))
    let l:i=l:i+1 | call append(l:i-1, " * Description :  ")
    let k = l:i
    let l:i=l:i+1 | call append(l:i-1, " * Functions :    ")
    let l:i=l:i+1 | call append(l:i-1, " * History :      ")
    let l:i=l:i+1 | call append(l:i-1, " * Others :       ")
    let l:i=l:i+1 | call append(l:i-1, "*****************************************************************************/")
    call cursor(k, 19)
endfunction

function Dxs_CodeFun()
    
    " 获取函数内容
    let l:v = getline(".")
    let l:n = matchlist(l:v, '[ \t]\?\([a-zA-Z0-9_]*\)[ \t]\?(\([^,)]*\)\?,\?\([^,)]*\),\?\([^,)]*\),\?\([^,)]*\),\?\([^,)]*\),\?\([^,)]*\),\?\([^,)]*\),\?\([^,)]*\)\?')

    if l:n == []
        echo l:n
        return
    endif
    " 找到插入位置
    let i = line(".")
    let i=i+0 | call append(i-1, "/*****************************************************************************")
    let i=i+1 | call append(i-1, " * @" . l:n[1] . " 简易说明 ")
    let i=i+1 | call append(i-1, " *   ")
    let m = i
    let i=i+1 | call append(i-1, " * @param ")
    let j = 2
    while l:n[j] != ""
        let t = matchlist(l:n[j], '[ \t]\?\([a-zA-Z0-9*_]*\)\?[ \t]\?\([a-zA-Z0-9*_]*\)\?[ \t]\?\([a-zA-Z0-9*_]*\)\?[ \t]\?\([a-zA-Z0-9*_]*\)\?[ \t]\?\([a-zA-Z0-9*_]*\)\?[ \t]\?\([a-zA-Z0-9*_]*\)\?')
        let k = 2
        while t[k+1] != ""
            let k = k + 1
        endwhile
        let i=i+1 | call append(i-1, " *  " . t[k] . ":")
        let j = j+1
    endwhile
    let i=i+1 | call append(i-1, " * ")
    let i=i+1 | call append(i-1, " * @return ")
    let i=i+1 | call append(i-1, " *  success: ")
    let i=i+1 | call append(i-1, " *  failed : ")
    let i=i+1 | call append(i-1, " * ")
    let i=i+1 | call append(i-1, " * Email : binya.wang@zznode.com    Date : " . strftime("%Y-%m-%d"))
    let i=i+1 | call append(i-1, "*****************************************************************************/")
    call cursor(m, 4)
endfunction

function Dxs_CodeSplit()
    let l:v = getline(".")
    let v = substitute(v, "^[ ]*", "", "")
    let v = substitute(v, "[ ]*$", "", "")
    let l:len = len(v)
    if len == 0
        call append(line("."), "/*****************************************************************************/")
        exec "d"
        return
    endif
    let l:tt = (80 - len + 1)/2 - 3
    if tt < 0
        return
    endif
    let str = ""
    while tt > 0
        let str =  str . "*"
        let tt = tt -1
    endwhile
    if (len % 2) == 0
        call append(line("."), "/" . str . " " . v . " " . str . "*/")
    else
        call append(line("."), "/" . str . " " . v . " " . str . "/")
    endif
    exec "d"
endfunction

nmap cs     :call Dxs_CodeSplit()<CR>
nmap cn     :call Dxs_CodeNote()<CR>
nmap cf     :call Dxs_CodeFun()<CR>
nmap cp     :call Dxs_CodePython()<CR>
