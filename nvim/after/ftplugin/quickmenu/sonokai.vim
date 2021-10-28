if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'quickmenu') ==# -1
    call add(g:sonokai_loaded_file_types, 'quickmenu')
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
" ft_begin: quickmenu {{{
" https://github.com/skywind3000/quickmenu.vim
highlight! link QuickmenuOption Green
highlight! link QuickmenuNumber Orange
highlight! link QuickmenuBracket Grey
highlight! link QuickmenuHelp Blue
highlight! link QuickmenuSpecial Grey
highlight! link QuickmenuHeader Purple
" ft_end
