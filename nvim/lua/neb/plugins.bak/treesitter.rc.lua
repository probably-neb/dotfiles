local present, treesitter_configs = pcall(require, "nvim-treesitter.configs")

if not present then
	print("could not load treesitter")
end

vim.keymap.set('n', ']f', '<nop>')
vim.keymap.set('n', '[f', '<nop>')

vim.keymap.set('x', 'ib', '<nop>')
vim.keymap.set('x', 'ab', '<nop>')

treesitter_configs.setup({
	highlight = {
		enable = true,
		disable = {},
		-- disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
		-- additional_vim_regex_highlighting = {'org'},
	},
	indent = {
		enable = true,
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
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
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
			enable = true,
            lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>sk"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>sj"] = "@parameter.inner",
			},
		},
		move = {
            enable = true,
			goto_next_start = {
				["]f"] = "@function.outer",
				["]c"] = "@class.outer",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]C"] = "@class.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[c"] = "@class.outer",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[C"] = "@class.outer",
			},
		},
	},
})
