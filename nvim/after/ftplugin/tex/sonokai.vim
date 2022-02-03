if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'tex') ==# -1
    call add(g:sonokai_loaded_file_types, 'tex')
else
    finish
endif
" ft_begin: tex {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_TEX{{{
highlight! link texStatement BlueItalic
highlight! link texOnlyMath Blue
highlight! link texDefName Yellow
highlight! link texNewCmd Orange
highlight! link texCmdName Green
highlight! link texBeginEnd Orange
highlight! link texBeginEndName Orange
highlight! link texDocType PurpleItalic
highlight! link texDocTypeArgs Orange
highlight! link texInputFile Green
" }}}
" vimtex: https://github.com/lervag/vimtex {{{
highlight! link texFileArg Yellow
highlight! link texCmd Yellow
" highlight! link texCmdPackage BlueItalic
" highlight! link texDefArgName Yellow
" highlight! link texCmdNewcmd Purple
" highlight! link texCmdClass Purple
" highlight! link texCmdTitle Purple
" highlight! link texCmdAuthor Purple
" highlight! link texCmdEnv Purple
" highlight! link texCmdPart Purple
highlight! link texEnvArgName Green
highlight! link texMathOper Red
highlight! link texMathZone Yellow
highlight! link texSpecialChar Red
highlight! link texRefArg Green
highlight! link Conceal Red
highlight! link texTabularChar Orange
highlight! link texSpecial Green
" }}}
" ft_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
