if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'yaml') ==# -1
    call add(g:sonokai_loaded_file_types, 'yaml')
else
    finish
endif
" ft_begin: yaml {{{
highlight! link yamlKey Red
highlight! link yamlConstant BlueItalic
highlight! link yamlString Green
" ft_end
