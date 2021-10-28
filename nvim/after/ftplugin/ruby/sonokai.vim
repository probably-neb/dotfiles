if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'ruby') ==# -1
    call add(g:sonokai_loaded_file_types, 'ruby')
else
    finish
endif
" ft_begin: ruby {{{
" builtin: https://github.com/vim-ruby/vim-ruby{{{
highlight! link rubyKeywordAsMethod Green
highlight! link rubyInterpolation Purple
highlight! link rubyInterpolationDelimiter Purple
highlight! link rubyStringDelimiter Yellow
highlight! link rubyBlockParameterList Fg
highlight! link rubyDefine Red
highlight! link rubyModuleName Red
highlight! link rubyAccess Red
highlight! link rubyMacro Red
highlight! link rubySymbol Fg
" }}}
" ft_end
