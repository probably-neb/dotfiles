local LLDB = {
    name = "Lauch LLDB",
    type = "lldb",
    request = "launch",
    
}
return {
	"mfussenegger/nvim-dap",
	config = function()
		local wk = require("which-key")
		local dap = require("dap")
		wk.register({
			b = {
				function()
					dap.toggle_breakpoint()
				end,
				"Toggle breakpoint",
			},
		}, { prefix = "<leader>d", noremap = true })
	end,
}
