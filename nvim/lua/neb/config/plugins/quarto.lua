return {
	"quarto-dev/quarto-nvim",
    ft = "quarto",
	dependencies = {
		"jmbuhr/otter.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("quarto").setup({
			lspFeatures = {
				enabled = true,
				languages = { "r", "python" },
				diagnostics = {
					enabled = true,
					triggers = { "BufWrite" },
				},
				completion = {
					enabled = true,
				},
			},
		})
        require("luasnip").filetype_extend("markdown", {"qmd"})
	end,
}
