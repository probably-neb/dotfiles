if vim.g.loaded_telescope ~= nil then
  local actions = require('telescope.actions')
  local builtin = require('telescope.builtin')
  -- local pre = "<leader>f"
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true }
  -- map('n', '<leader><esc>', ':nohlsearch<cr>', options)
  -- map('n', '<leader>n', ':bnext<cr>', options)
  -- map('n', '<leader>p', ':bprev<cr>', options)
  map('n', '<leader>g', ':lua require("telescope.builtin").find_files()<cr>', opts)
  map('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<cr>', opts)
  map('n', '<leader>fb', ':lua require("telescope.builtin").buffers()<cr>', opts)
  map('n', '<leader>fh', ':lua require("telescope.builtin").help_tags()<cr>', opts)
  map('n', '<leader>fd', ':lua require("telescope.builtin").diagnostics()<cr>', opts)
  map('n', '<leader>fm', ':lua require("telescope.builtin").man_pages()<cr>', opts)
  map('n', '<leader>fz', ':lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', opts)
  map('n', '<leader>ft', ':lua require("telescope.builtin").tags()<cr>', opts)
  -- Global remapping
  ------------------------------
  require('telescope').setup {
    defaults = {
      mappings = {
        n = {
          ["q"] = actions.close,
        },
      },
    }
  }
end
