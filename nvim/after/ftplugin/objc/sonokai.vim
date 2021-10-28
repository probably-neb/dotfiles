if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'objc') ==# -1
    call add(g:sonokai_loaded_file_types, 'objc')
else
    finish
endif
" ft_begin: c/cpp/objc/objcpp {{{
" vim-cpp-enhanced-highlight: https://github.com/octol/vim-cpp-enhanced-highlight{{{
highlight! link cLabel Red
highlight! link cppSTLnamespace BlueItalic
highlight! link cppSTLtype BlueItalic
highlight! link cppAccess Red
highlight! link cppStructure Red
highlight! link cppSTLios BlueItalic
highlight! link cppSTLiterator BlueItalic
highlight! link cppSTLexception Red
" }}}
" vim-cpp-modern: https://github.com/bfrg/vim-cpp-modern{{{
highlight! link cppSTLVariable BlueItalic
" }}}
" chromatica: https://github.com/arakashic/chromatica.nvim{{{
highlight! link Member TSVariable
highlight! link Variable TSVariable
highlight! link Namespace TSNamespace
highlight! link EnumConstant TSStructure
highlight! link chromaticaException TSException
highlight! link chromaticaCast TSLabel
highlight! link OperatorOverload TSOperator
highlight! link AccessQual TSOperator
highlight! link Linkage TSOperator
highlight! link AutoType TSType
" }}}
" vim-lsp-cxx-highlight https://github.com/jackguo380/vim-lsp-cxx-highlight{{{
highlight! link LspCxxHlSkippedRegion Grey
highlight! link LspCxxHlSkippedRegionBeginEnd TSKeyword
highlight! link LspCxxHlGroupEnumConstant TSStructure
highlight! link LspCxxHlGroupNamespace TSNamespace
highlight! link LspCxxHlGroupMemberVariable TSVariable
" }}}
" ft_end
" ft_begin: objc {{{
" builtin: {{{
highlight! link objcModuleImport Red
highlight! link objcException Red
highlight! link objcProtocolList Fg
highlight! link objcDirective Red
highlight! link objcPropertyAttribute Purple
highlight! link objcHiddenArgument Fg
" }}}
" ft_end
