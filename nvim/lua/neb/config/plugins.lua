local plugins = {

	-- { "mfussenegger/nvim-dap" },

	-- tools
	{
		"chipsenkbeil/distant.nvim",
        cmd = "Distant",
		config = function()
			require("distant").setup({
				-- Applies Chip's personal settings to every machine you connect to
				--
				-- 1. Ensures that distant servers terminate with no connections
				-- 2. Provides navigation bindings for remote directories
				-- 3. Provides keybinding to jump into a remote file's parent directory
				["*"] = require("distant.settings").chip_default(),
				["arm"] = {
					mode = "ssh",
				},
			})
		end,
	},
	{ "mbbill/undotree", cmd="UndotreeToggle"},

	-- utilities
	{
		"windwp/nvim-autopairs",
        event = "VeryLazy",
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup()
		end,
	},
	{
		"kylechui/nvim-surround",
        event="VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		-- god this plugin is fucking amazing
		"wellle/targets.vim",
        event="VeryLazy",
	},
	{
		"numToStr/Comment.nvim",
        -- TODO: move binds to `keys` load event
        event="VeryLazy",
		config = function()
			require("Comment").setup()
			local api = require("Comment.api")
			-- additional comment bindings (definitely not taken from vs****)
			-- visual mode linewise
			local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
			vim.keymap.set("x", "<C-/>", function()
				vim.api.nvim_feedkeys(esc, "nx", false)
				api.toggle.linewise(vim.fn.visualmode())
			end)
			-- visual mode blockwise
			vim.keymap.set("x", "<C-\\>", function()
				vim.api.nvim_feedkeys(esc, "nx", false)
				api.toggle.blockwise(vim.fn.visualmode())
			end)
			vim.keymap.set("n", "<C-/>", api.toggle.linewise.current, { silent = false })
		end,
	},
	{ "nvim-lua/plenary.nvim" },
	{ "BurntSushi/ripgrep" },

	-- asthetics
	{
		"nvim-lualine/lualine.nvim",
        event="VeryLazy",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	{
		"morhetz/gruvbox",
		config = function()
			vim.g.gruvbox_contrast_light = "hard"
		end,
		lazy = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
        event = "BufReadPre",
		config = function()
			vim.opt.list = true
			-- vim.opt.listchars:append "space:⋅"
			require("indent_blankline").setup({
                -- char = "▏",
				space_char_blankline = " ",
				show_trailing_blankline_indent = false,
			})

			if vim.g.colors_name == "base16" then
				local color = vim.g.colors.base02
				vim.cmd("highlight IndentBlanklineChar guifg=" .. color .. " gui=nocombine")
				vim.cmd("highlight IndentBlanklineSpaceChar guifg=" .. color .. " gui=nocombine")
			end
		end,
	},

	-- filetype specific plugins

	{
		"dag/vim-fish",
		ft = { "fish" },
	},
	{ "simrat39/rust-tools.nvim" , ft = 'rust'},
	-- {
	--     "lervag/vimtex",
	--     config = function()
	--         vim.cmd([[ let g:tex_flavor='latex' ]])
	--         vim.cmd([[ let g:vimtex_view_method='zathura' ]])
	--         vim.cmd[[ let g:vimtex_quickfix_mode=1 ]],
	--     end,
	-- },

	-- @tpope appreciation corner
	{
		-- this is because I can't spell
		"tpope/vim-abolish",
	},

	-- @folke appreciation corner
	-- {
	-- 	"folke/todo-comments.nvim",
	-- 	dependencies = "nvim-lua/plenary.nvim",
	-- 	config = function()
	-- 		require("todo-comments").setup({
	-- 			signs = false,
	-- 		})
	-- 	end,
	-- },
	{
		"folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[ colorscheme tokyonight]]
        end
	},
	{
		"folke/neodev.nvim",
        ft = 'lua'
	},

	-- @ThePrimeagen appreciation corner

	{
		"ThePrimeagen/vim-be-good",
		cmd = "VimBeGood",
	},
	-- {
	-- 	"ThePrimeagen/harpoon",
	-- },
}

return plugins
