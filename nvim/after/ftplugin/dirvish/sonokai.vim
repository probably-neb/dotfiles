if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'dirvish') ==# -1
    call add(g:sonokai_loaded_file_types, 'dirvish')
else
    finish
endif
" ft_begin: dirvish {{{
" https://github.com/justinmk/vim-dirvish
highlight! link DirvishPathTail Blue
highlight! link DirvishArg Yellow
" ft_end