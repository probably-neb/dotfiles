set conceallevel=2
let g:tex_conceal="abdgms"
set foldmethod=marker

function! s:match_math_fracs() abort " {{{1
  if !g:vimtex_syntax_conceal.math_fracs | return | endif
	syntax match texMathSymbol '\?frac.(\d+)..(\d+).' contained conceal cchar=\1/\2 
endfunction

function! s:match_conceal_fancy() abort " {{{1
  syntax match texCmd         '\\colon\>' conceal cchar=:
  syntax match texCmd         '\\dots'    conceal cchar=…
  syntax match texCmd         '\\ldots'   conceal cchar=…
  syntax match texCmdItem     '\\item\>' "  conceal cchar=○
  syntax match texTabularChar '\\\\' "     conceal cchar=⏎
endfunction
