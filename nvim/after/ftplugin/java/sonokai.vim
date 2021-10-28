if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'java') ==# -1
    call add(g:sonokai_loaded_file_types, 'java')
else
    finish
endif
" ft_begin: java {{{
" builtin: {{{
highlight! link javaClassDecl Red
highlight! link javaMethodDecl Red
highlight! link javaVarArg Fg
highlight! link javaAnnotation Purple
highlight! link javaUserLabel Purple
highlight! link javaTypedef OrangeItalic
highlight! link javaParen Fg
highlight! link javaParen1 Fg
highlight! link javaParen2 Fg
highlight! link javaParen3 Fg
highlight! link javaParen4 Fg
highlight! link javaParen5 Fg
" }}}
" ft_end
