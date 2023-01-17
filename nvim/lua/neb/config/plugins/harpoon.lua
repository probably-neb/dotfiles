-- TODO: swap this and re-goto? (f) (',' <-> ';')
return {
	"ThePrimeagen/harpoon",
	event = "BufReadPost",
	config = function()
		local pre = ","

		-- local map = function(bind, cmd, sub)
		-- 	if not sub then
		-- 		sub = "ui"
		-- 	end
		-- 	vim.api.nvim_set_keymap(
		-- 		"n",
		-- 		pre .. bind,
		-- 		"<Cmd>lua require('harpoon." .. sub .. "')." .. cmd .. "<CR>",
		-- 		{ noremap = true, silent = false }
		-- 	)
		-- end

		local poon = function(cmd, sub)
            sub = sub or "ui"
			return "<Cmd>lua require('harpoon." .. sub .. "')." .. cmd .. "<CR>"
		end

        require('which-key').register({
            m = {poon("add_file()", "mark"), "add_file()"},
            v = {poon("toggle_quick_menu()"), "toggle_quick_menu()"},
            a = {poon("nav_file(4)"), "nav_file(4)"},
            s = {poon("nav_file(3)"), "nav_file(3)"},
            d = {poon("nav_file(2)"), "nav_file(2)"},
            f = {poon("nav_file(1)"), "nav_file(1)"},
        }, {prefix=pre, silent=false})
	end,
}
