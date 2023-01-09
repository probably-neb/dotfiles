local telescope_leader = "<leader>f"

local M = { "nvim-telescope/telescope.nvim", keys = {
	telescope_leader,
}, cmd = "Telescope" }

M.config = function()
	local opts = { noremap = true, silent = false }

	local map = function(key, finder, picker_opts)
		local map_func = function()
            local picker_opts = function()
                if type(picker_opts) == "table" then
                    return picker_opts
                elseif type(picker_opts) == "function" then
                    return picker_opts()
                end
            end
			require("telescope.builtin")[finder](picker_opts())
		end
		vim.keymap.set("n", telescope_leader .. key, map_func, opts)
	end

	map("f", "find_files")
    map("w", "find_files",
        function()
            return {
                search_file = vim.fn.expand("%:e")
            }
        end)
	map("s", "lsp_workspace_symbols")
	map("g", "live_grep")
	map("b", "buffers")
	map("h", "help_tags")
	map("d", "diagnostics")
	map("m", "man_pages")
	map("z", "current_buffer_fuzzy_find")
	map("t", "tags")
	map("a", "builtin")
	map("l", "treesitter")
	map("rl", "reloader")
	map("c", "commands")
	map("k", "keymaps")
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
                theme = "ivy"
            }
        }
	})
end

return M
