if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'ps1') ==# -1
    call add(g:sonokai_loaded_file_types, 'ps1')
else
    finish
endif
" ft_begin: ps1 {{{
" vim-ps1: https://github.com/PProvost/vim-ps1{{{
highlight! link ps1FunctionInvocation Green
highlight! link ps1FunctionDeclaration Green
highlight! link ps1InterpolationDelimiter Purple
highlight! link ps1BuiltIn BlueItalic
" }}}
" ft_end
