return {
	-- dir = "~/code/exploring/refactoring.nvim",
    "ThePrimeagen/refactoring.nvim",
    dev =true,
	ft = {
		"typescript",
		"javascript",
		"lua",
		"c",
		"cpp",
		"golang",
		"python",
		"java",
		"php",
		"ruby",
		"rust",
	},
	config = function(opts)
		require("refactoring").setup(opts)
		local extract = function(what)
			return { "<Esc><Cmd>lua require('refactoring').refactor('Extract " .. what .. "')<CR>", what }
		end
		local debug = function(what, ext,mode)
			-- local ext = (mode == 'n') and "{ normal = true }" or "{}"
			return { ":lua require('refactoring').debug." .. what .. "(" .. ext .. ")<CR>", what ,mode=mode} --, mode=mode}
		end
		local p = function() end
        local modes = require('neb.config.plugins.wk').modes
		require("which-key").register({
			name = "refactoring",
			["<leader>r"] = {
				e = {
					f = extract("Function"),
					v = extract("Variable"),
					t = extract("Function To File"),
                    mode = "v",
				},
				p = modes({
						n = debug("print_var", "{normal = true}"),
						v = debug("print_var", "{}"),
				}),
                -- {
                --     debug("print_var", "{normal = true}","n"),
                --     debug("print_var", "{}","v"),
                -- }
			},
		}, { noremap = true, silent = true, expr = false })
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
