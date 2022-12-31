return {
    {"nvim-treesitter/playground", cmd = "TSPlaygroundToggle",
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
	}})
end},
    {"windwp/nvim-ts-autotag", ft = {'html', 'xml', 'javascript', 'typescript', 'php', 'markdown'},
    config = function()
        
    require('nvim-treesitter.configs').setup({
	autotag = {
		enable = true,
	},
    })
        end},
{"nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    dependencies = {"nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-refactor"},
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
	refactor = {
		highlight_definitions = {
			enable = true,
			clear_on_cursor_move = true,
		},
		highlight_current_scope = {
			enable = false,
		},
	},
})
end},
    {"nvim-treesitter/nvim-treesitter-textobjects",
        -- TODO: class that generates these bindings or just stores them and can return the
        -- keys for setting lazy load keys
        config = function()
local treesitter_configs = require("nvim-treesitter.configs")

vim.keymap.set('n', ']f', '<nop>')
vim.keymap.set('n', '[f', '<nop>')

vim.keymap.set('x', 'ib', '<nop>')
vim.keymap.set('x', 'ab', '<nop>')

treesitter_configs.setup({
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
	}})
        end
    },
}
