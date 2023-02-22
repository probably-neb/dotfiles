return {
	"folke/which-key.nvim",
	-- dir = "~/code/exploring/which-key.nvim",
	-- dev = true,
	-- will be loaded by the first plugin that needs it
	lazy = true,
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})
	end,
    modes = function(opts)
        mappings = {}
        for mode,mapping in pairs(opts) do
            mapping.mode = mode
            table.insert(mappings,mapping)
        end
        return mappings
    end
}
