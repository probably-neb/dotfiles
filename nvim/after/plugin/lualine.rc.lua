local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'sonokai',
    section_separators = {'', ''},
    component_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    -- lualine_b = {'branch'}
    lualine_b = {"require'lsp-status'.status()"},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    -- lualine_x = {
      -- { 'diagnostics', sources = {'nvim_diagnostic'}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      -- 'encoding',
      -- 'filetype'
    -- },
    lualine_x = {'location'},
    -- lualine_y = {'progress'},
    lualine_y = {"os.date('%a, %b %d %Y')"},
    lualine_z = {{"os.date('%_I:%M')", color='MiniStatusLineModeCommand'}}
  },
  inactive_sections = {
    lualine_a = {},
    --lualine_b = {},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {'location'},
    lualine_y = {"require('lsp-status').status()"},
    lualine_z = {"os.date('%a')"}
  },
  tabline = {},
  --extensions = {'fugitive'}
}

