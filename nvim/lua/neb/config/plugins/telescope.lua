local PREFIX = "<leader>f"

local plugin = {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		keys = {
			PREFIX,
		},
		cmd = { "Telescope", "Ex" },

        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
        },

		config = function()
			require("telescope").load_extension("file_browser")
			require("which-key").add({
				{
					PREFIX,
					group = "Telescope",
				},
				mode = "n",
				silent = true,
				{
					PREFIX .. "j",
					function()
						require("telescope.builtin").find_files({})
					end,
					desc = "find_files",
				},
				{
					PREFIX .. "e",
					function()
						require("telescope").extensions.file_browser.file_browser({
							path = "%:p:h:",
						})
					end,
					desc = "file_browser",
				},
				{
					PREFIX .. "s",
					require("telescope.builtin")["lsp_workspace_symbols"],
					desc = "lsp_workspace_symbols",
					silent = true,
				},
				{ PREFIX .. "g", require("telescope.builtin")["live_grep"], desc = "live_grep", silent = true },
				{ PREFIX .. "h", require("telescope.builtin")["help_tags"], desc = "help_tags", silent = true },
				{ PREFIX .. "d", require("telescope.builtin")["diagnostics"], desc = "diagnostics", silent = true },
				{ PREFIX .. "m", require("telescope.builtin")["man_pages"], desc = "man_pages", silent = true },
				{
					PREFIX .. "z",
					require("telescope.builtin")["current_buffer_fuzzy_find"],
					desc = "current_buffer_fuzzy_find",
					silent = true,
				},
				{ PREFIX .. "t", require("telescope.builtin")["tags"], desc = "tags", silent = true },
				{ PREFIX .. "a", require("telescope.builtin")["builtin"], desc = "builtin", silent = true },
				{ PREFIX .. "l", require("telescope.builtin")["treesitter"], desc = "treesitter", silent = true },
				{ PREFIX .. "r", require("telescope.builtin")["reloader"], desc = "reloader", silent = true },
				{ PREFIX .. "c", require("telescope.builtin")["commands"], desc = "commands", silent = true },
				{ PREFIX .. "k", require("telescope.builtin")["keymaps"], desc = "keymaps", silent = true },
				{ PREFIX .. "b", require("telescope.builtin")["buffers"], desc = "buffers", silent = true },
			})

			-- Global remapping
			------------------------------
			require("telescope").setup({
				defaults = {
					mappings = {
						n = {
							["q"] = require("telescope.actions").close,
						},
					},
				},
				pickers = {
					find_files = {
						theme = "ivy",
					},
				},
				extensions = {
					file_browser = {
						-- sets initial path to current buffers directory
						path = "%:p:h:",
						-- start with path not cwd
						cwd_to_path = true,
						-- not working with lazy loading?
						hijack_netrw = true,
						hidden = true,
					},
				},
			})
		end,
	},
}
return plugin
