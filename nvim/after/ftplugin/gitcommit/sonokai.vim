if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'gitcommit') ==# -1
    call add(g:sonokai_loaded_file_types, 'gitcommit')
else
    finish
endif
" ft_begin: gitcommit {{{
highlight! link gitcommitSummary Red
highlight! link gitcommitUntracked Grey
highlight! link gitcommitDiscarded Grey
highlight! link gitcommitSelected Grey
highlight! link gitcommitUnmerged Grey
highlight! link gitcommitOnBranch Grey
highlight! link gitcommitArrow Grey
highlight! link gitcommitFile Green
" ft_end
