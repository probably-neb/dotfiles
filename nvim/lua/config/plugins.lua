vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("lewis6991/impatient.nvim")

	use({ "/home/neb/code/nvim-rustdocs", rocks = "htmlparser" })

	-- lsp, mason?, lints, daps, oh my!
	use({
		{ "jayp0521/mason-null-ls.nvim" },
		{ "jose-elias-alvarez/null-ls.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup({
					providers = {
						"mason.providers.client",
						"mason.providers.registry-api",
					},
					log_level = vim.log.levels.DEBUG,
				})
				require("mason-lspconfig").setup()
				require("null-ls").setup({
					debug = true,
				})
				require("mason-null-ls").setup({
					ensure_installed = { "stylua", "jq", "prettier" },
					automatic_setup = true,
				})
				require("mason-null-ls").setup_handlers()
			end,
		},
	})
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	})

	use("neovim/nvim-lspconfig")
	use("nvim-lua/lsp-status.nvim")
	use("mfussenegger/nvim-dap")
	-- -- cmp stuff
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			-- "quangnguyen30192/cmp-nvim-ultisnips",
			"uga-rosa/cmp-dictionary",
			{ "mtoohey31/cmp-fish", ft = "fish" },
		},
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.opt.list = true
			-- vim.opt.listchars:append "space:⋅"
			require("indent_blankline").setup({
				-- char = "",
				space_char_blankline = " ",
				show_trailing_blankline_indent = false,
			})

			local color = vim.g.colors.base02
			vim.cmd("highlight IndentBlanklineChar guifg=" .. color .. " gui=nocombine")
			vim.cmd("highlight IndentBlanklineSpaceChar guifg=" .. color .. " gui=nocombine")
		end,
	})

	use({
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
	})
	-- use 'zbirenbaum/copilot.lua'
	-- -- find way to load after
	-- use 'zbirenbaum/copilot-cmp'

	use("nvim-lua/plenary.nvim")

	use("glepnir/lspsaga.nvim")

	use({
		{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
		"nvim-treesitter/playground",
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-refactor",
		"windwp/nvim-ts-autotag",
	})

	use("nvim-telescope/telescope.nvim")

	use("BurntSushi/ripgrep")

	use("nvim-lua/popup.nvim")

	use({
		"windwp/nvim-autopairs",
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup()
		end,
	})
	-- god this plugin is fucking amazing
	use("wellle/targets.vim")

	-- tpope appreciation corner
	use({
		"tpope/vim-abolish",
	})

	-- folke appreciation corner
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				signs = false,
			})
		end,
	})

	use({
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
	})

	use({
		"morhetz/gruvbox",
		config = function()
			vim.g.gruvbox_contrast_light = "hard"
		end,
		opt = true,
	})

	use({ "dag/vim-fish", ft = { "fish" } })

	-- use {'simrat39/rust-tools.nvim', ft = {'rs'}}
	use({ "simrat39/rust-tools.nvim" })

	use({ "L3MON4D3/LuaSnip", tag = "v1.*" })
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

	use("cohama/lexima.vim")

	-- use 'godlygeek/tabular'
	-- let g:haskell_tabular = 1
	-- vmap a= :Tabularize /=<CR>
	-- vmap a; :Tabularize /::<CR>
	-- vmap a- :Tabularize /-><CR> use 'dkarter/bullets.vim'

	-- -- use 'kyazdani42/nvim-web-devicons'

	-- prime corner
	use({ "ThePrimeagen/vim-be-good", opt = true })
	use({ "ThePrimeagen/harpoon" })

	use({
		"lervag/vimtex",
		config = function()
			vim.cmd([[ let g:tex_flavor='latex' ]])
			vim.cmd([[ let g:vimtex_view_method='zathura' ]])
			vim.cmd([[ let g:vimtex_quickfix_mode=1 ]])
		end,
		-- use 'KeitaNakamura/tex-conceal.vim'
		--     let g:tex_conceal='abdmgs'
		--     hi Conceal ctermbg=none
	})
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
