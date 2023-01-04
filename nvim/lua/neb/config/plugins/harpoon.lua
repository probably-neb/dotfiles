-- TODO: swap this and re-goto? (f) (',' <-> ';')
return {
	"ThePrimeagen/harpoon",
	event = "BufReadPost",
	config = function()
		local pre = ","

		local map = function(bind, cmd, sub)
			if not sub then
				sub = "ui"
			end
			vim.api.nvim_set_keymap(
				"n",
				pre .. bind,
				"<Cmd>lua require('harpoon." .. sub .. "')." .. cmd .. "<CR>",
				{ noremap = true, silent = false }
			)
		end

		map("m", "add_file()", "mark")
		map("v", "toggle_quick_menu()")
		map("a", "nav_file(4)")
		map("s", "nav_file(3)")
		map("d", "nav_file(2)")
		map("f", "nav_file(1)")
	end,
}
