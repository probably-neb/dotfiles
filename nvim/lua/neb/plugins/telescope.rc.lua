if vim.g.loaded_telescope ~= nil then
	local opts = { noremap = true, silent = false }
    local themes = require('telescope.themes')
	local telescope_leader = "<leader>f"

	local map = function(key, finder, picker_opts)
        local map_func = function()
            require('telescope.builtin')[finder](picker_opts)
        end
		vim.keymap.set("n", telescope_leader .. key, map_func, opts)
	end

	map( "f", "find_files", themes.get_ivy())
	map( "g", "live_grep")
	map( "b", "buffers")
	map( "h", "help_tags")
	map( "d", "diagnostics")
	map( "m", "man_pages")
	map( "z", "current_buffer_fuzzy_find")
	map( "t", "tags")
	map( "a", "builtin")
	map( "l", "treesitter")
    map( "rl", "reloader")
    map( "c", "commands")
    map( "k", "keymaps")
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
	})
end
