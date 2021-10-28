if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'erlang') ==# -1
    call add(g:sonokai_loaded_file_types, 'erlang')
else
    finish
endif
" ft_begin: erlang {{{
" builtin: https://github.com/vim-erlang/vim-erlang-runtime{{{
highlight! link erlangAtom Fg
highlight! link erlangVariable Fg
highlight! link erlangLocalFuncRef Green
highlight! link erlangLocalFuncCall Green
highlight! link erlangGlobalFuncRef Green
highlight! link erlangGlobalFuncCall Green
highlight! link erlangAttribute BlueItalic
highlight! link erlangPipe Red
" }}}
" ft_end