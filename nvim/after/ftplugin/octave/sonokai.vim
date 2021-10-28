if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'octave') ==# -1
    call add(g:sonokai_loaded_file_types, 'octave')
else
    finish
endif
" ft_begin: octave {{{
" vim-octave: https://github.com/McSinyx/vim-octave{{{
highlight! link octaveDelimiter Orange
highlight! link octaveSemicolon Grey
highlight! link octaveOperator Orange
highlight! link octaveVariable BlueItalic
highlight! link octaveVarKeyword BlueItalic
" }}}
" ft_end
