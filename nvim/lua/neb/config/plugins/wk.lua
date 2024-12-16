return {
	"folke/which-key.nvim",
	-- dir = "~/code/exploring/which-key.nvim",
	-- dev = true,
	-- will be loaded by the first plugin that needs it
	lazy = true,
    init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
    end,
    opts = {
        icons = {
            mappings = false,
        }
    },
    modes = function(opts)
        local mappings = {}
        for mode,mapping in pairs(opts) do
            mapping.mode = mode
            table.insert(mappings,mapping)
        end
        return mappings
    end
}
