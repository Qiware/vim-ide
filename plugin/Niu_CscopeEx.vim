if exists("g_has_loaded_rebuild")
    finish
endif

let g_has_loaded_rebuild = 1

if has("cscope")
set cscopequickfix=c-,e-,t-,s-
set cst

nmap <C-n>  :cn<CR>
nmap <C-p>  :cp<CR>
nmap <C-l>  :cl<CR>
nmap <C-c>      :cs f c <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-c> :cs f s <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-g> :cs f e <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-f> :cs f f <C-R>=expand("%:t:r")<CR><CR>

function My_rebuild()
    " 更新CSCOPE
    let l:find = 'find ./ ! -type l -name "*.h" '
    let l:find = l:find . '-o -name "*.c" '
    let l:find = l:find . '-o -name "*.cc" '
    let l:find = l:find . '-o -name "*.cpp" '
    let l:find = l:find . '-o -name "*.hpp" '
    let l:find = l:find . '-o -name "*.C" '
    let l:find = l:find . '-o -name "*.H" '
    let l:find = l:find . '-o -name "*.go" '
    let l:find = l:find . '> cscope.files'
    call system(l:find)
    call system("cscope -Rbkq -i cscope.files")

    " 更新CTAGS
    call system("ctags -L -< cscope.files")
    cs reset
endfunction
command Rebuild call My_rebuild()

endif
