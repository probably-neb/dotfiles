if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'rust') ==# -1
    call add(g:sonokai_loaded_file_types, 'rust')
else
    finish
endif
" ft_begin: rust {{{
" builtin: https://github.com/rust-lang/rust.vim{{{
highlight! link rustStructure Red
highlight! link rustIdentifier OrangeItalic
highlight! link rustModPath BlueItalic
highlight! link rustModPathSep Grey
highlight! link rustSelf OrangeItalic
highlight! link rustSuper OrangeItalic
highlight! link rustDeriveTrait Purple
highlight! link rustEnumVariant Purple
highlight! link rustMacroVariable OrangeItalic
highlight! link rustAssert Green
highlight! link rustPanic Green
highlight! link rustPubScopeCrate BlueItalic
highlight! link rustAttribute Purple
" }}}
" ft_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
