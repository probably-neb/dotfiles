-- mason <-> lspconfig names 'https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md'
return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				config = {
					ensure_installed = {
						"rust_analyzer",
						"pyright",
						"pylsp",
						"sumneko_lua",
						"clangd",
					},
                    automatic_installation= true,
				},
			},
		},
		config = function()
			require("mason").setup({
				providers = {
					"mason.providers.client",
					"mason.providers.registry-api",
				},
				log_level = vim.log.levels.DEBUG,
			})
		end,
	},
}
