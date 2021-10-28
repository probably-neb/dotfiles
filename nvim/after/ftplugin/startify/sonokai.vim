if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'startify') ==# -1
    call add(g:sonokai_loaded_file_types, 'startify')
else
    finish
endif
" ft_begin: startify/quickmenu {{{
" https://github.com/mhinz/vim-startify
" https://github.com/skywind3000/quickmenu.vim
highlight! link StartifyBracket Grey
highlight! link StartifyFile Green
highlight! link StartifyNumber Orange
highlight! link StartifyPath Grey
highlight! link StartifySlash Grey
highlight! link StartifySection Blue
highlight! link StartifyHeader Red
highlight! link StartifySpecial Grey
" ft_end
