if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'sh') ==# -1
    call add(g:sonokai_loaded_file_types, 'sh')
else
    finish
endif
" ft_begin: sh/zsh {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH{{{
highlight! link shRange Fg
highlight! link shOption Purple
highlight! link shQuote Yellow
highlight! link shVariable BlueItalic
highlight! link shDerefSimple BlueItalic
highlight! link shDerefVar BlueItalic
highlight! link shDerefSpecial BlueItalic
highlight! link shDerefOff BlueItalic
highlight! link shVarAssign Red
highlight! link shFunctionOne Green
highlight! link shFunctionKey Red
" }}}
" ft_end
