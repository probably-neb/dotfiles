if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'text') ==# -1
    call add(g:sonokai_loaded_file_types, 'text')
else
    finish
endif
let g:sonokai_last_modified = 'Fri Sep  9 13:50:03 UTC 2022'
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
