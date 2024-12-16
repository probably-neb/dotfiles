return {
	"akinsho/toggleterm.nvim",
	keys = { "<Leader>lg" },
	cmd = "ToggleTerm",
	config = function(_, opts)
		local tt = require("toggleterm")
		tt.setup(opts)
		local Terminal = require("toggleterm.terminal").Terminal

		local lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
        })

		require("which-key").register({
			["<Leader>lg"] = {
				function()
					lazygit:toggle()
				end,
				"LazyGit",
			},
		}, { noremap = true, silent = true })
		-- vim.api.nvim_set_keymap("n", "<Leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
	end,
}
