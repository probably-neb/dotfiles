require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
    -- disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
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
	--"latex",
	"bash",
  "rust",
  "haskell",
  "go",
	-- "markdown"
  },
}
