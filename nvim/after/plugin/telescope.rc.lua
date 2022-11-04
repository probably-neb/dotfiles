if vim.g.loaded_telescope ~= nil then
  local opts = { noremap = true }
  local req = ':lua require("telescope.builtin").'

  local map = function(pre, key, finder)
     vim.api.nvim_set_keymap('n', pre..key, req..finder..'()<cr>', opts)
  end

  local pre = '<leader>f'
  map('', '<leader>g', 'find_files')
  map(pre, 'g', 'live_grep')
  map(pre, 'b', 'buffers')
  map(pre, 'h', 'help_tags')
  map(pre, 'd', 'diagnostics')
  map(pre, 'm', 'man_pages')
  map(pre, 'z', 'current_buffer_fuzzy_find')
  map(pre, 't', 'tags')
  map(pre, 'a', 'builtin')
  map(pre, 'l', 'treesitter')
  -- Global remapping
  ------------------------------
  require('telescope').setup {
    defaults = {
      mappings = {
        n = {
          ["q"] = require('telescope.actions').close,
        },
      },
    }
  }
end
