
"-------------------------------------------------------
" Vundle 管理插件
" -------------------------------------------------------
"
"
set nocompatible              " be iMproved

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
"Bundle 'scrooloose/syntastic'
Bundle 'gmarik/vundle'

Bundle  'https://github.com/scrooloose/nerdcommenter.git'
" My bundles here:
"
" original repos on GitHub
Bundle 'Yggdroot/indentLine'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non-GitHub repos
Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
Bundle 'file:///Users/gmarik/path/to/plugin'
" ...
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on     " required!

" -----------------------------------------------------
" YCM配置
" -----------------------------------------------------
" 寻找全局配置文件
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
" 禁用syntastic来对python检查
let g:syntastic_ignore_files=[".*\.py$"] 

" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1
" 开启语义补全
" 修改对C语言的补全快捷键，默认是CTRL+space，修改为ALT+;未测出效果
let g:ycm_key_invoke_completion = '<C-/>'
" 设置转到定义处的快捷键为ALT+G，未测出效果
"nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR> 
"关键字补全
let g:ycm_seed_identifiers_with_syntax = 0
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
" 让补全行为与一般的IDE一致
set completeopt=longest,menu
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
" 在注释中也可以补全
let g:ycm_complete_in_comments=1
" 输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
" 错误标识符
let g:ycm_error_symbol='>>'
" 警告标识符
let g:ycm_warning_symbol='>*'
" 不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
let g:ycm_use_ultisnips_completer=0
"
"""""""""""""""""""""""""""""""""""
" 批量注释插件
" 已修改为：
" ，mc 注释
" ，mm 用一对注释符注释
" ，mu 反注释
" ，m<space> 注释/反注释
"""""""""""""""""""""""""""""""""""
let g:mapleader=","

" ----------------------------------------------------
" vim基本配置
" ---------------------------------------------------
"
set background=dark
syntax enable   " 语法高亮

set t_Co=256

"colorscheme Monokai-Refined  " Sublime Text2着色模式
let g:molokai_original = 1
let g:rehash256 = 1  
"colorscheme Tomorrow-Night-Bright
":colorscheme candy
"colorscheme   koehler       "vim主题颜色模板
"colorscheme solarized

let g:solarized_termcolors = 256
let g:solarized_termtrans = 0    
 
"colorscheme torte
colorscheme molokaichange
"
"hi cFunctions      ctermfg=120                cterm=bold


set nocompatible                 "去掉有关vi一致性模式，避免以前版本的bug和局限    
filetype plugin indent on "允许文件类型检测
set nu          "显示行号

"set cursorcolumn      " 垂直对齐线
"set mouse=a     "支持鼠标在所有模式中可使用
set mouse=nv    "支持鼠标在普通模式n和可视模式v中使用

syntax on       "语法高亮

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新文件标题
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
"
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头 

func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\##########################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: lyh") 
        call append(line(".")+2, "\# E-mail: ") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\##########################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else 
	call setline(1, "/*======================================================") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: lyh") 
        call append(line(".")+2, "    > E-mail:  ") 
		call append(line(".")+3, "    > Other :  ") 
        call append(line(".")+4, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+5, " =======================================================*/") 
        call append(line(".")+6, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+7, "#include<iostream>")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+7, "#include<stdio.h>")
        call append(line(".")+8, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 

set cursorline            " 突出显示当前行
set magic                 " 设置魔术匹配控制，可以通过:h magic查看更详细的帮助信息
set autoindent            " 自动对齐，也就是把当前行的对齐格式应用到下一行(自动缩进）
set cindent               " cindent是特别针对 C语言语法自动缩进
set tabstop=4             " Tab键的宽度
set expandtab             " 输入tab自动转换为空格
"set noexpandtab           " 空格转换为tab
":%retab                   " 将Tab与空格相互替换;加！是用于处理非空白字符之后的tab,即所有的tab，若不加！，则只处理行首的tab

set softtabstop=4         " 统一缩进为4
set shiftwidth=4          " 缩进空格个数
set smartindent           " 依据上面的对齐格式，智能的选择对齐方式，对于类似C语言编写上有用
set ai!                   " 设置自动缩进 

"highlight SyntasticErrorSign guifg=white guibg=black
"highlight Comment ctermfg=8  guifg=blue 
                          " 更改注释颜色1~8
"hi Normal ctermbg=Black ctermfg=white 
                          " 背景色 前景色
set foldenable            " 开始折叠
set foldmethod=syntax     " 设置语法折叠
"set foldcolumn=4          " 设置折叠区域的宽度
setlocal foldlevel=4      " 设置折叠层数
"set foldclose=all         " 设置为自动关闭折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' :'zo')<CR>
                            " 用空格键来开关折叠
" ------------------------------------
" 垂直对齐线
" ------------------------
" IndentGuides 插件
"map <leader>ig :IndentGuidesToggle   " ig起不到作用
" IndentLines 插件
" :IndentLinesToggle toggles lines on and off
nmap <F7> :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_char = '¦'  " ¦, ┆, ︙ or │

"
let g:indent_guides_enable_on_vim_startup = 0 " 0默认关闭
" 显示不同的颜色
let g:indent_guides_auto_colors = 0
" 尺寸，空格才有效
let g:indent_guides_guide_size = 1 
" 从第二层开始显示
"let g:indent_guides_start_level = 2 
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd guibg=red ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置编码自动识别
"set fileencodings=utf-8,cp936,big5,euc-jp,euc-kr,latin1,ucs-bom
"set fileencodings=utf-8,gbk
"set ambiwidth=double

"taglist 源代码查找
let Tlist_Show_One_File=1  "不同时显示多个文件的tag,只显示当前文件的
let Tlist_Exit_OnlyWindow=1 "taglist窗口是最后一个时，退出vim

"let g:Tlist_Enable_Fold_Column=0 "don't waste space to display the column
let Tlist_File_Fold_Auto_Close=1 "让当前不被编辑的文件的方法列表自动折叠起来
let Tlist_Use_Right_Window=1 "把taglist窗口放在屏幕的左侧，１在右侧
let Tlist_Auto_Open=0 "启动vim,自动打开taglist
let Tlist_Show_Menu=1 "显示taglist菜单
let Tlist_WinWidth = 20 "taglist窗口宽度

"""""""""""""""""""""""""""""""""""""
" 文件管理器
" winmanager           - 布局管理
" winfileexplorer.vim  - 改良的Explorer插件
" wintagexplorer.vim – winmanager提供的tag插件，用处不大
"""""""""""""""""""""""""""""""""""""
" 设置界面分割
"let g:winManagerWindowLayout = "FileExplorer|TagList"
" 开关快捷键
nmap <silent> <F3> :WMToggle<cr>
"设置winmanager的宽度，默认为25
"let g:winManagerWidth = 30
"在进入vim时自动打开winmanager
"let g:AutoOpenWinManager = 1
"
"""""""""""""""""""""""""""""""""""""

"ColorSchemeExplorer   开启配色预览器

highlight Pmenu  ctermbg=white  ctermfg=Black
"配色面板
highlight PmenuSel ctermbg=lightgrey ctermfg=red
"选中项　
"自定义快捷键
"打开或关闭TagList
map <F4> :TlistToggle<CR>    
"显示调试信息,再次回车退出小窗口
map <F9> :YcmDiags<CR>

"映射Ctrl+C为复制，需安装vim-gnome
vnoremap <C-C> "+y    
map <F5> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q <CR><CR>
 
