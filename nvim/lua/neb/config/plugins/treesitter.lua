return {
	{
		"nvim-treesitter/playground",
		cmd = "TSPlaygroundToggle",
		config = function()
			local treesitter_configs = require("nvim-treesitter.configs")

			treesitter_configs.setup({

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
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		-- local filetypes
		ft = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"rescript",
			"xml",
			"php",
			"markdown",
			"glimmer",
			"handlebars",
			"hbs",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter-textobjects",
			--          {dir="~/code/tree-sitter-templ", ft = { "templ" }, lazy= true, dev = true},
			-- {"IndianBoy42/tree-sitter-just", ft= {"just"}, lazy = true},
		},
		event = "BufReadPost",
		config = function()
			local treesitter_configs = require("nvim-treesitter.configs")

			treesitter_configs.setup({
				highlight = {
					enable = true,
					disable = {},
					-- disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
					-- additional_vim_regex_highlighting = {'org'},
				},
				indent = {
					enable = true,
					disable = { "python" },
				},
				context_commentstring = { enable = true, enable_autocmd = true },
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
					-- "org",
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
					-- "help",
					-- "gitignore",
					"c",
					"css",
					"scss",
					"cpp",
					"javascript",
					"typescript",
					"svelte",
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
							["<leader>sn"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>sp"] = "@parameter.inner",
						},
					},
					-- TODO: block goto's
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
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 10, -- Maximum number of lines to show for a single context
				trim_scope = "inner", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			})
		end,
		event = "BufReadPost",
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		config = function()
			vim.keymap.set("n", "]f", "<nop>")
			vim.keymap.set("n", "[f", "<nop>")

			vim.keymap.set("x", "ib", "<nop>")
			vim.keymap.set("x", "ab", "<nop>")
		end,
	},
	{
		"IndianBoy42/tree-sitter-just",
		build = ":TSUpdate",
		ft = { "just" },
		lazy = true,
		config = true,
	},
}
