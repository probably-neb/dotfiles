-- TODO: swap this and re-goto? (f) (',' <-> ';')
return {
	"ThePrimeagen/harpoon",
	event = "BufRead",
	config = function()
		local pre = ","

        -- IDEA: use autocmd to mark files as they are opened
        -- already marked files __shouldn't__ change position
        -- what is the space complexity of this algorithm?
        local autopoon = vim.api.nvim_create_augroup('poon',{clear=true})
        vim.api.nvim_create_autocmd({'BufReadPost'},{
            pattern = "*",
            group = autopoon,
            callback = function() require('harpoon.mark').add_file() end
        })


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
