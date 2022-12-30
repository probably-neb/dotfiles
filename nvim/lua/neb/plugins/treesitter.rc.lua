local present, treesitter_configs = pcall(require, 'nvim-treesitter.configs')

if not present then
    print("could not load treesitter")
end

treesitter_configs.setup {
  highlight = {
    enable = true,
    disable = {},
    -- disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    -- additional_vim_regex_highlighting = {'org'},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
     -- "tsx",
     "toml",
     "fish",
     "php",
     "json",
     "yaml",
     "html",
     "python",
     "vim",
     "lua",
     "org",
     "latex",
     "bash",
     "rust",
     "haskell",
     "go",
     "query",
     "markdown",
     "lua",
     "make",
     "regex",
     "toml",
     "help",
     "gitignore",
     "c",
     "css",
     "cpp",
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  refactor = {
      highlight_definitions = {
          enable = true,
          clear_on_cursor_move = true,
      },
      highlight_current_scope = {
          enable = false,
      },
  },
  autotag = {
      enable = true,
  },
  textobjects = {
      select = {
          keymaps = {
              ["af"] = "@function.outer"
          }
      }
  }
}
