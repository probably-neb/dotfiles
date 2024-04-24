local refactoring_leader = "<leader>r"
return {
	-- dir = "~/code/exploring/refactoring.nvim",
	"ThePrimeagen/refactoring.nvim",
	-- dev = true,
	ft = {
		"typescript",
		"javascript",
		"lua",
		"c",
		"cpp",
		"golang",
		"go",
		"python",
		"java",
		"php",
		"ruby",
		"rust",
	},
	keys = {},
	config = function(opts)
		require("refactoring").setup(opts)
		local modes = require("neb.config.plugins.wk").modes

		local refactoring = require("refactoring")

		require("which-key").register({
			name = "refactoring",
			e = {
				f = {
					function()
						refactoring.refactor("Extract Function")
					end,
					"Extract Function",
				},
				ff = {
					function()
						refactoring.refactor("Extract Function To File")
					end,
					"Extract Function To File",
				},
				v = {
					function()
						refactoring.refactor("Extract Variable")
					end,
					"Extract Variable",
				},
				mode = "x",
			},
			p = modes({
				n = {
					function()
						refactoring.debug.print_var({ normal = true })
					end,
					"Print Var",
					mode = "n",
				},
				v = {
					function()
						refactoring.debug.print_var({})
					end,
					"Print Var",
					mode = "v",
				},
			}),
			-- {
			--     debug("print_var", "{normal = true}","n"),
			--     debug("print_var", "{}","v"),
			-- }
		}, { prefix = refactoring_leader, noremap = true, silent = true, expr = false })

		vim.api.nvim_create_user_command("Refactoring", function(cmd)
			if cmd.fargs[1] == "clean" then
				require("refactoring").debug.cleanup({})
			end
		end, {
			nargs = 1,
			complete = function()
				return { "clean" }
			end,
		})
	end,
	opts = {},
}
