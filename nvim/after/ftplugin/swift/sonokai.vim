if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'swift') ==# -1
    call add(g:sonokai_loaded_file_types, 'swift')
else
    finish
endif
" ft_begin: swift {{{
" swift.vim: https://github.com/keith/swift.vim{{{
highlight! link swiftInterpolatedWrapper Purple
highlight! link swiftInterpolatedString Purple
highlight! link swiftProperty Fg
highlight! link swiftTypeDeclaration Red
highlight! link swiftClosureArgument OrangeItalic
highlight! link swiftStructure Red
" }}}
" ft_end
