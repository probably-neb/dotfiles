local telescope_leader = "<leader>f"

local maps = {
	j = {
		"find_files",
		function()
			require("telescope.builtin").find_files({})
		end,
	},
	e = {
		"file_browser",
		function()
			require("telescope").extensions.file_browser.file_browser({
				path = "%:p:h:",
			})
		end,
	},
	s = "lsp_workspace_symbols",
	g = "live_grep",
	h = "help_tags",
	d = "diagnostics",
	m = "man_pages",
	z = "current_buffer_fuzzy_find",
	t = "tags",
	a = "builtin",
	l = "treesitter",
	rl = "reloader",
	c = "commands",
	k = "keymaps",
	b = "buffers",
}

local generate_mappings = function()
	local mappings = { name = "Telescope" }
	for k, v in pairs(maps) do
		local action = nil
		local description = nil
		if type(v) == "string" then
			description = v
			action = function()
				require("telescope.builtin")[v]()
			end
		elseif type(v) == "table" then
			description = v[1]
			action = v[2]
		end
		mappings[k] = {
			action,
			description,
		}
	end
	return mappings
end

local plugin = {
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
			require("telescope").load_extension("file_browser")
			local mappings = generate_mappings()
			require("which-key").register(mappings, { mode = "n", prefix = telescope_leader, silent = false })

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
