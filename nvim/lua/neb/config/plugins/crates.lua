local M = {
	"saecki/crates.nvim",
	version = "v0.3.0",
	event = "BufRead Cargo.toml",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		-- call setup and enable null_ls
		require("null-ls")
		require("crates").setup({
			null_ls = {
				enabled = true,
			},
		})
		-- add cmp source for buffer
        local cmp = require('cmp')
        -- for some reason source is not being found by cmp
        -- registering it myself fixes it
        cmp.register_source('crates', require('crates.src.cmp').new())
		cmp.setup.buffer({ sources = { { name = "crates" } } })
	end,
}
-- this is to avoid the startup cost of loading this plugin
-- every time cmp and null-ls start
function M.is_loaded()
	return require("neb.config.lazy").is_plugin_loaded("crates.nvim")
end
return M
