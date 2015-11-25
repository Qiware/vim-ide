" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
    syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd        " Show (partial) command in status line.
"set showmatch        " Show matching brackets.
"set ignorecase        " Do case insensitive matching
"set smartcase        " Do smart case matching
"set incsearch        " Incremental search
"set autowrite        " Automatically save before commands like :next and :make
"set hidden        " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

set nobackup
set noswapfile
set nocompatible
set autoindent
set nowrap

set showmatch
set showmode
set number
set cursorline "显示横线
set cursorcolumn
set scrolloff=2
set title
set guioptions=
"set mouse=a
"set mousemodel=extend

set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
language messages zh_CN.utf-8

set hlsearch
set incsearch
"set ignorecase


"超过80列的问题高亮显示
"match DiffText /\%>80v.*$/

" 第80列显示ColorColumn配色
set cc=80

set tabstop=4
set shiftwidth=4
" set expandtab

filetype plugin on
syntax enable
syntax on

set t_Co=256 "开启8/16/256颜色支持
colorscheme evening

" 自定义高亮显示
hi HI term=standout ctermfg=1 ctermbg=3 guifg=Blue guibg=Yellow
match DiffText /\t/
call matchadd("HI", "FIXME:.*")
call matchadd("HI", "TODO:.*")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"
let NERDTreeIgnore = ['\.pyc$'] " python
let NERDTreeIgnore += ['\.o$'] " c/c++
let NERDTreeIgnore += ['\cscope.'] " cscope
let NERDTreeIgnore += ['\tags'] " ctags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key map
"
"nmap <F2>  :set tabstop=4<CR>:set expandtab<CR>
"nmap <F3>  :set tabstop=8<CR>:set noexpandtab<CR>
nmap <F3>   :AS<CR>
nmap <F4>   :A<CR>
nmap <F5>   :NERDTreeToggle<CR>
nmap <F6>   :Tlist<CR>
nmap <F11>   :call libcallnr("gvimfullscreen.dll","ToggleFullScreen", 0)<CR>


nmap <F8>    "*p<CR>
nmap <F9>    "let @+ = @*<CR>
nmap <F10>   "+p<CR>
"nmap <F12>  :cd %:p:h<CR>

" nmap <C-j>  gj
" nmap <C-K>  gk

nmap \w     :vertical resize +1<CR>
nmap \h     :topleft resize +1<CR>
nmap \\w    :vertical resize +10<CR>
nmap \\h    :topleft resize +10<CR>

nmap YY     :let @a=getline(".")"<CR>
nmap PP     :call append(line("."), @a)<CR>

nmap \t     :%s/\t/    /gc<CR>
nmap \c     :center<CR>


nmap <F2>   :bn<CR>

if has("cscope")
    nmap <C-n>  :cn<CR>
    nmap <C-p>  :cp<CR>
    nmap <C-l>  :cl<CR>
    set cscopequickfix=c-,e-

    " 设置查找快捷键
    set cst
    nmap <C-c>      :cs f c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-c><C-c> :cs f e <C-R>=expand("<cword>")<CR><CR>
endif

" 插入日期，时间(插入模式)
imap <C-d><C-d> <C-R>=strftime("%Y-%m-%d")<CR>
imap <C-t><C-t> <C-R>=strftime("%H:%M:%S")<CR>

" 插入邮箱
imap <C-z><C-z> zouqifeng@letv.com
imap <C-g><C-g> Qifeng.zou <Qifeng.zou.job@hotmail.com>

" web
nmap <C-j> :call g:Jsbeautify()<CR> 

"让vim记忆上次编辑的位置
autocmd BufReadPost *
            \ if line("'\"")>0&&line("'\"")<=line("$") |
            \    exe "normal g'\"" |
            \ endif
"让vim记忆上次编辑的位置

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Head / Foot
"
function HeadFoot(h, f)
    let l:b = line("'<")
    let l:e = line("'>")
    echo l:b
    echo l:e
    call append(l:b-1, a:h)
    call append(l:e+1, a:f)
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:mail = "Qifeng.zou.job@hotmail.com"
let g:author = "Qifeng.zou"

nmap <C-C><C-F>    :cs f f <C-R>=expand("%:t:r")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示 
"winpos 5 5          " 设定窗口位置 
"set lines=40 columns=155    " 设定窗口大小 
"set nu              " 显示行号 
set go=             " 不要图形按钮 
"color asmanian2     " 设置背景主题 
set guifont=Courier_New:h10:cANSI   " 设置字体 
"syntax on           " 语法高亮 

autocmd InsertLeave * se nocul  " 用浅色高亮当前行 
autocmd InsertEnter * se cul    " 用浅色高亮当前行 

set ruler           " 显示标尺 
set showcmd         " 输入的命令显示出来，看的清楚些 
"set cmdheight=1     " 命令行（在状态行下）的高度，设置为1 
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议) 
"set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离 
set novisualbell    " 不要闪烁(不明白) 
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容 
set laststatus=1    " 启动显示状态行(1),总是显示状态行(2) 
set foldenable      " 允许折叠 
set foldmethod=manual   " 手动折叠 
"set background=dark "背景使用黑色
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限 
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
" 设置配色方案
"syntax enable
"set background=dark
"colorscheme murphy
"字体
"if (has("gui_running"))
"   set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
"endif
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   新文件标题
"新建.c,.h,.sh,.java文件，自动插入文件头
"autocmd BufNewFile *.cpp,*.[ch],*.java,*.sh exec ":call SetTitle()"
autocmd BufNewFile *.cpp,*.[ch],*.java, exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == "sh"
        call setline(1, "################################################################################")
        call append(line(".")+0, "## Coypright(C) 2014-2024 Qiware technology Co., Ltd")
        call append(line(".")+1, "##")
        call append(line(".")+2, "## 文件名: ".expand("%"))
        call append(line(".")+3, "## 版本号: 1.0")
        call append(line(".")+4, "## 描  述: ")
        call append(line(".")+5, "## 作  者: # Qifeng.zou # ".strftime("%c").expand(" #"))
        call append(line(".")+6, "################################################################################")
        call append(line(".")+7, "\#!/bin/bash")
        call append(line(".")+8, "")
    else
        call setline(1, "/******************************************************************************")
        call append(line(".")+0, " ** Coypright(C) 2014-2024 Qiware technology Co., Ltd")
        call append(line(".")+1, " **")
        call append(line(".")+2, " ** 文件名: ".expand("%"))
        call append(line(".")+3, " ** 版本号: 1.0")
        call append(line(".")+4, " ** 描  述: ")
        call append(line(".")+5, " ** 作  者: # Qifeng.zou # ".strftime("%c").expand(" #"))
        call append(line(".")+6, " ******************************************************************************/")
    endif
    if &filetype == 'cpp'
        call append(line(".")+7, "#include<iostream>")
        call append(line(".")+8, "using namespace std;")
        call append(line(".")+9, "")
    endif
    if &filetype == 'c'
        call append(line(".")+7, "#include<stdio.h>")
        call append(line(".")+8, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

colorscheme default
" 查找选中内容
vnoremap <silent> * :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy/<C-R><C-R>=substitute(
    \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy?<C-R><C-R>=substitute(
            \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>

"nmap YY     :call setreg("+", getline(line(1), line("$")))<CR>:echo "Buffer Was Sended To Clipboard !"<CR>
nmap YY     :call setreg("+", join(getline(line(1), line("$")), "\n"))<CR>
hi normal ctermbg=0
