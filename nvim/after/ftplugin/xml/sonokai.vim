if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'xml') ==# -1
    call add(g:sonokai_loaded_file_types, 'xml')
else
    finish
endif
" ft_begin: xml {{{
" builtin: https://github.com/chrisbra/vim-xml-ftplugin{{{
highlight! link xmlTag Green
highlight! link xmlEndTag Blue
highlight! link xmlTagName RedItalic
highlight! link xmlEqual Orange
highlight! link xmlAttrib Blue
highlight! link xmlEntity Red
highlight! link xmlEntityPunct Red
highlight! link xmlDocTypeDecl Grey
highlight! link xmlDocTypeKeyword RedItalic
highlight! link xmlCdataStart Grey
highlight! link xmlCdataCdata Purple
highlight! link xmlString Green
" }}}
" ft_end
