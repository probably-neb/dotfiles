local telescope_leader = "<leader>f"

return {
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = "nvim-telescope/telescope.nvim",
		lazy = true,
	},
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			telescope_leader,
		},
		cmd = { "Telescope", "Ex" },

		config = function()
			local opts = { noremap = true, silent = false }

			-- TODO: rework mapping function to use which_key
			local map = function(key, finder, picker_opts)
				local map_func = function()
					local picker_opts = function()
						if type(picker_opts) == "table" then
							return picker_opts
						elseif type(picker_opts) == "function" then
							return picker_opts()
						end
					end
					local picker = vim.split(finder, ".", { plain = true })
					require("telescope.builtin")[finder](picker_opts())
				end
				vim.keymap.set("n", telescope_leader .. key, map_func, opts)
			end

			map("w", "find_files", function()
				return {
					search_file = "." .. vim.fn.expand("%:e"),
				}
			end)
			local builtin = function(name, picker_opts)
				local picker_opts = function()
					if type(picker_opts) == "table" then
						return picker_opts
					elseif type(picker_opts) == "function" then
						return picker_opts()
					end
                    -- else nil
				end
				return function()
					require("telescope.builtin")[name](picker_opts())
				end
			end
			require("which-key").register({
				name = "Telescope",
				e = { builtin("find_files"), "find_files" },
				s = { builtin("lsp_workspace_symbols"), "lsp_workspace_symbols" },
				g = { builtin("live_grep"), "live_grep" },
				b = { builtin("buffers"), "buffers" },
				h = { builtin("help_tags"), "help_tags" },
				d = { builtin("diagnostics"), "diagnostics" },
				m = { builtin("man_pages"), "man_pages" },
				z = { builtin("current_buffer_fuzzy_find"), "current_buffer_fuzzy_find" },
				t = { builtin("tags"), "tags" },
				a = { builtin("builtin"), "builtin" },
				l = { builtin("treesitter"), "treesitter" },
				rl = { builtin("reloader"), "reloader" },
				c = { builtin("commands"), "commands" },
				k = { builtin("keymaps"), "keymaps" },
			}, { mode = "n", prefix = telescope_leader, silent = false })

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
						-- not working with lazy loading?
						hijack_netrw = true,
					},
				},
			})
			require("telescope").load_extension("file_browser")
			vim.keymap.set("n", telescope_leader .. "b", require("telescope").extensions.file_browser.file_browser)
		end,
	},
}
