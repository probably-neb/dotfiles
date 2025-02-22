vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim")
    use("dstein64/vim-startuptime")

	-- lsp, mason?, lints, daps, oh my!
	use({
		{ "neovim/nvim-lspconfig" },
		{ "nvim-lua/lsp-status.nvim" },
		{ "mfussenegger/nvim-dap" },
		{ "glepnir/lspsaga.nvim" },

		{ "jayp0521/mason-null-ls.nvim" },
		{ "jose-elias-alvarez/null-ls.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        {
			"williamboman/mason.nvim",
		},
	})

	-- cmp stuff
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"uga-rosa/cmp-dictionary",
			{ "mtoohey31/cmp-fish", ft = "fish" },
		},
	})

	-- tools
	use({
		{ "L3MON4D3/LuaSnip", tag = "v1.*" },
		{
			"chipsenkbeil/distant.nvim",
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
		{ "mbbill/undotree" },
		{ "nvim-telescope/telescope.nvim" },
	})

	use({
		{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
		"nvim-treesitter/playground",
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-refactor",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	})

	-- utilities
	use({
		{
			"windwp/nvim-autopairs",
			config = function()
				local autopairs = require("nvim-autopairs")
				autopairs.setup()
			end,
		},
		{
			"kylechui/nvim-surround",
			config = function()
				require("nvim-surround").setup()
			end,
		},
		{
			-- god this plugin is fucking amazing
			"wellle/targets.vim",
		},
		{
			"numToStr/Comment.nvim",
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
	})

	-- asthetics
	use({
		{
			"nvim-lualine/lualine.nvim",
			requires = { "nvim-tree/nvim-web-devicons" },
		},
		{
			"morhetz/gruvbox",
			config = function()
				vim.g.gruvbox_contrast_light = "hard"
			end,
			opt = true,
		},
		{
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				vim.opt.list = true
				-- vim.opt.listchars:append "space:⋅"
				require("indent_blankline").setup({
					-- char = "",
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
	})

	-- filetype specific plugins
	use({
		{
			"dag/vim-fish",
			ft = { "fish" },
		},
		{ "simrat39/rust-tools.nvim" },
		{
			"lervag/vimtex",
			config = function()
				vim.cmd([[ let g:tex_flavor='latex' ]])
				vim.cmd([[ let g:vimtex_view_method='zathura' ]])
				vim.cmd([[ let g:vimtex_quickfix_mode=1 ]])
			end,
		},
	})

	-- @tpope appreciation corner
	use({
		-- this is because I can't spell
		"tpope/vim-abolish",
	})

	-- @folke appreciation corner
	use({
		{
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup({
					signs = false,
				})
			end,
		},
		{
			"folke/tokyonight.nvim",
		},
        {
            "folke/neodev.nvim"
        }
	})

	-- @ThePrimeagen appreciation corner
	use({
		{
			"ThePrimeagen/vim-be-good",
			opt = true,
		},
		{
			"ThePrimeagen/harpoon",
		},
	})

	-- this is why I am organizing right now
	-- TODO: this is probably a dependency for something
	-- use("nvim-lua/popup.nvim")

	-- deprecated
	-- use({
	--     "SirVer/ultisnips",
	--     config = function()
	--         vim.cmd([[ let g:UltiSnipsEnableSnipMate = 0 ]])
	--         vim.cmd([[ let g:UltiSnipsSnippetDirectories=['/home/neb/dotfiles/nvim/UltiSnips/'] ]])
	--         vim.cmd([[ let g:UltiSnipsExpandTrigger = '<tab>' ]])
	--         vim.cmd([[ let g:UltiSnipsJumpForwardTrigger = '<tab>' ]])
	--         vim.cmd([[ let g:UltiSnipsJumpBackwardTrigger = '<s-tab>' ]])
	--         vim.cmd([[ let g:UltiSnipsListSnippets = '<c-x><c-s>' ]])
	--         vim.cmd([[ let g:UltiSnipsRemoveSelectModeMappings = 0 ]])
	--     end,
	-- })

	-- use("cohama/lexima.vim")

	-- use 'godlygeek/tabular'
	-- let g:haskell_tabular = 1
	-- vmap a= :Tabularize /=<CR>
	-- vmap a; :Tabularize /::<CR>
	-- vmap a- :Tabularize /-><CR> use 'dkarter/bullets.vim'

	-- use 'KeitaNakamura/tex-conceal.vim'
	--     let g:tex_conceal='abdmgs'
	--     hi Conceal ctermbg=none
end)

-- vmap a= :Tabularize /=<CR>
-- vmap a; :Tabularize /::<CR>
-- vmap a- :Tabularize /-><CR> use 'dkarter/bullets.vim'

-- use 'prurigro/vim-markdown-concealed'
-- let g:vim_markdown_folding_disabled = 1
-- let g:vim_markdown_math = 1
-- let g:vim_markdown_frontmatter = 1
-- let g:vim_markdown_toml_frontmatter = 1
-- let g:vim_markdown_json_frontmatter = 1
-- let g:vim_markdown_strikethrough = 1
-- let g:vim_markdown_new_list_item_indent = 2

-- use 'rhysd/vim-clang-format'
-- let g:clang_format#code_style = 'google'
-- let g:clang_format#auto_format = 1
-- let g:clang_format#style_options = {
--       \ "BreakBeforeBraces": "Custom",
--       \"BraceWrapping" : {
--         \ "AfterClass" : "true",
--         \ "AfterControlStatement" : "false",
--         \ "AfterEnum" : "true",
--         \ "AfterFunction" : "false",
--         \ "AfterNamespace" : "true",
--         \ "AfterStruct" : "true",
--         \ "AfterUnion" : "true",
--         \ "AfterExternBlock" : "true",
--         \ "BeforeCatch" : "true",
--         \ "BeforeElse" : "true",
--         \ "IndentBraces" : "false",
--         \ "SplitEmptyFunction" : "false",
--         \ "SplitEmptyRecord" : "false",
--         \ "SplitEmptyNamespace" : "false"},
--         \ "IndentCaseBlocks" : "true",
--         \ "AllowShortFunctionsOnASingleLine" : "Empty",
--         \ "AllowShortLoopsOnASingleLine" : "false",
--         \ "AllowShortCaseLabelsOnASingleLine" : "false",
--         \ "AllowShortIfStatementsOnASingleLine" : "Never",
--         \ "AllowShortBlocksOnASingleLine" : "Empty"}
--         \ "RemoveBracesLLVM" : "true",
-- " Haskell
-- use 'neovimhaskell/haskell-vim'
-- " use 'eagletmt/neco-ghc'
-- " use 'eagletmt/ghcmod-vim'
-- " use 'Shougo/vimproc.vim', {'do' : 'make'}
-- use 'prurigro/vim-markdown-concealed'
-- let g:vim_markdown_folding_disabled = 1
-- let g:vim_markdown_math = 1
-- let g:vim_markdown_frontmatter = 1
-- let g:vim_markdown_toml_frontmatter = 1
-- let g:vim_markdown_json_frontmatter = 1
-- let g:vim_markdown_strikethrough = 1
-- let g:vim_markdown_new_list_item_indent = 2
