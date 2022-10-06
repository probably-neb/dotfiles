if !exists('g:loaded_telescope') | finish | endif

" nnoremap <silent> <leader>;f <cmd>Telescope find_files<cr>
" nnoremap <silent> <C-f> <cmd>Telescope live_grep<cr>
" " nnoremap <silent> \\ <cmd>Telescope current_buffer_fuzzy_find<cr>
" nnoremap <silent> <leader>;; <cmd>Telescope help_tags<cr>
" nnoremap <silent> <leader>;d <cmd>Telescope diagnostics<cr>
" nnoremap <silent> <leader>;m <cmd>Telescope man_pages<cr>
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> <C-f> <cmd>Telescope live_grep<cr>
" nnoremap <silent> \\ <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
nnoremap <silent> ;d <cmd>Telescope diagnostics<cr>
nnoremap <silent> ;m <cmd>Telescope man_pages<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF

