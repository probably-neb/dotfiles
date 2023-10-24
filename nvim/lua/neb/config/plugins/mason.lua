return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
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
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = {
			ensure_installed = {
				"rust_analyzer@nightly",
				"pylsp",
				"lua_ls",
				"clangd",
			},
			automatic_installation = true,
		},
	},
	---@param server_name string: name of server
	---@param module string: "lspconfig" | "mason"
	convert_lsp_name = function(server_name, module)
		local to = "lspconfig"
		local from = "mason"
		if module == "lspconfig" then
			to = "mason"
			from = "lspconfig"
        -- error that [from]_to_[not lspconfig or mason] is not valid will work well enough
        -- elseif module ~= "mason" then
        --     return nil
		end

		return require("mason-lspconfig").get_mappings()[from .. "_to_" .. to][server_name]
	end,
}
