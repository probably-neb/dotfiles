if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'NeogitCommitView') ==# -1
    call add(g:sonokai_loaded_file_types, 'NeogitCommitView')
else
    finish
endif
" ft_begin: NeogitStatus/NeogitCommitView {{{
" https://github.com/TimUntersberger/neogit
highlight! link NeogitNotificationInfo Blue
highlight! link NeogitNotificationWarning Yellow
highlight! link NeogitNotificationError Red
highlight! link NeogitDiffAdd Green
highlight! link NeogitDiffDelete Red
highlight! link NeogitDiffContextHighlight CursorLine
highlight! link NeogitHunkHeaderHighlight TabLine
highlight! link NeogitHunkHeader TabLineFill
highlight! link NeogitCommandCodeNormal Green
highlight! link NeogitCommandCodeError Red
highlight! link NeogitCommitViewHeader diffIndexLine
highlight! link NeogitFilePath diffFile
" ft_end
