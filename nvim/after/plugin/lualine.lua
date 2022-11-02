local status, lualine = pcall(require, "lualine")
if (not status) then return end

local colors = vim.g.colors

local function setup(theme_colors)
  local theme = {
    normal = {
      a = { fg = theme_colors.bg, bg = theme_colors.normal },
      b = { fg = theme_colors.light_fg, bg = theme_colors.alt_bg },
      c = { fg = theme_colors.fg, bg = theme_colors.bg },
    },
    replace = {
      a = { fg = theme_colors.bg, bg = theme_colors.replace },
      b = { fg = theme_colors.light_fg, bg = theme_colors.alt_bg },
    },
    insert = {
      a = { fg = theme_colors.bg, bg = theme_colors.insert },
      b = { fg = theme_colors.light_fg, bg = theme_colors.alt_bg },
    },
    visual = {
      a = { fg = theme_colors.bg, bg = theme_colors.visual },
      b = { fg = theme_colors.light_fg, bg = theme_colors.alt_bg },
    },
    inactive = {
      a = { fg = theme_colors.dark_fg, bg = theme_colors.bg },
      b = { fg = theme_colors.dark_fg, bg = theme_colors.bg },
      c = { fg = theme_colors.dark_fg, bg = theme_colors.bg },
    },
  }

  theme.command = theme.normal
  theme.terminal = theme.insert

  return theme
end

local base16 = setup({
    bg = colors.Base00,
    alt_bg = colors.Base02,
    dark_fg = colors.Base03,
    fg = colors.Base04,
    light_fg = colors.Base05,
    normal = colors.Base0D,
    insert = colors.Base0B,
    visual = colors.Base0E,
    replace = colors.Base09,
})

lualine.setup {
  options = {
    icons_enabled = true,
    theme = base16,
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

