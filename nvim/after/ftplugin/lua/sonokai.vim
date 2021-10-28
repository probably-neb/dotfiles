if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'lua') ==# -1
    call add(g:sonokai_loaded_file_types, 'lua')
else
    finish
endif
" ft_begin: lua {{{
" builtin: {{{
highlight! link luaFunc Green
highlight! link luaFunction Red
highlight! link luaTable Fg
highlight! link luaIn Red
" }}}
" vim-lua: https://github.com/tbastos/vim-lua{{{
highlight! link luaFuncCall Green
highlight! link luaLocal Red
highlight! link luaSpecialValue Green
highlight! link luaBraces Fg
highlight! link luaBuiltIn BlueItalic
highlight! link luaNoise Grey
highlight! link luaLabel Purple
highlight! link luaFuncTable BlueItalic
highlight! link luaFuncArgName Fg
highlight! link luaEllipsis Red
highlight! link luaDocTag Green
" }}}
" ft_end
