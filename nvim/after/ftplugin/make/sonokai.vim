if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'make') ==# -1
    call add(g:sonokai_loaded_file_types, 'make')
else
    finish
endif
" ft_begin: make {{{
highlight! link makeIdent Purple
highlight! link makeSpecTarget BlueItalic
highlight! link makeTarget Orange
highlight! link makeCommands Red
" ft_end
