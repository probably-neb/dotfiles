if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'scala') ==# -1
    call add(g:sonokai_loaded_file_types, 'scala')
else
    finish
endif
" ft_begin: scala {{{
" builtin: https://github.com/derekwyatt/vim-scala{{{
highlight! link scalaNameDefinition Fg
highlight! link scalaInterpolationBoundary Purple
highlight! link scalaInterpolation Purple
highlight! link scalaTypeOperator Red
highlight! link scalaOperator Red
highlight! link scalaKeywordModifier Red
" }}}
" ft_end