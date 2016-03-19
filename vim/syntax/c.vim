"highlight Functions   ctermfg 函数名颜色
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunctions gui=NONE cterm=NONE ctermfg=green
"
"宏
syn match Macros     "\<[A-Z_]*\>"
hi  Macros    cterm=bold  ctermfg=170

