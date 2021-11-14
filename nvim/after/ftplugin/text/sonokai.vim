if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'text') ==# -1
    call add(g:sonokai_loaded_file_types, 'text')
else
    finish
endif
let g:sonokai_last_modified = 'Thu Nov 11 07:35:15 AM UTC 2021'
