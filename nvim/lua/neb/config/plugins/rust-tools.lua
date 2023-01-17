return {
	"simrat39/rust-tools.nvim",
	-- "kdarkhan/rust-tools.nvim",
	setup = function(opts)
		local rt = require("rust-tools")
		rt.setup({
			server = {
				capabilities = opts.capabilities,
				on_attach = function(client, bufnr)
					opts.on_attach(client, bufnr)

					vim.keymap.set({ "v", "n" }, "<C-h>", rt.hover_actions.hover_actions, { buffer = bufnr })
					vim.keymap.set(
						{ "v", "n" , "i"},
						"<C-g>",
						rt.code_action_group.code_action_group,
						{ buffer = bufnr }
					)
				end,
				flags = opts.flags,
				standalone = false,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							allFeatures = true,
							overrideCommand = {
								"cargo",
								"clippy",
								"--workspace",
								"--message-format=json",
								"--all-targets",
								"--all-features",
								"--",
								"-A",
								"clippy::needless_return",
							},
						},
						completion = {
							-- enable completion of private items from the current workspace
							privateEditable = {
								enable = true,
							},
						},
					},
				},
			},
		})
	end,
}
