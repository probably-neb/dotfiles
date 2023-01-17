return {
	-- lsp, mason?, lints, daps, oh my!
	{ "nvim-lua/lsp-status.nvim" },
	-- { "glepnir/lspsaga.nvim" },
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		-- enabled = false,
		config = function()
			-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
			require("neodev").setup({
				-- add any options here, or leave empty to use the default settings
			})

			-- mason must be loaded so sources installed with it can be found
			require("mason")
			local nvim_lsp = require("lspconfig")
			local format = require("neb.config.plugins.lsp.format")

			-- initialize lsp_status
			local lsp_status = require("lsp-status")
			lsp_status.register_progress()
			lsp_status.config({
				-- diagnostics = false,
				current_function = false,
				status_symbol = "lsp:",
			})

			-- after the language server attaches to the current buffer
			local on_attach = function(client, bufnr)
				-- Mappings.

				local opts = { noremap = true, silent = false, buffer = bufnr }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set({ "v", "n" }, "<C-h>", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders))
				end, opts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v", "i"}, "<C-g>", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<C-b>", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<space>=", function()
					-- vim.lsp.buf.format {async = true}
					format.format()
				end, { noremap = true, buffer = bufnr })

				vim.api.nvim_create_user_command("Format", function(_bs)
                    vim.lsp.buf.format { async = true}
				end, {})

				lsp_status.on_attach(client)
			end

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
			vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
			local flags = { debounce_text_changes = 50 }

			local options = { on_attach = on_attach, capabilities = capabilities, flags = flags }
			local function setup(server, opts)
				opts = vim.tbl_deep_extend("force", {}, options, opts or {})
				nvim_lsp[server].setup(opts)
			end

            local ft = vim.bo.filetype
			setup("ansiblels")
            if ft == "haskell" then
                setup("hls")
            end
			setup("clangd", { handlers = lsp_status.extensions.clangd.setup() })
			-- setup("pyright", { single_file_support = true })
			setup("pylsp", { single_file_support = true })
            if ft == "go" then
                setup("gopls", {
                    settings = {
                        gopls = {
                            experimentalPostfixCompletions = true,
                            analyses = {
                                unusedparams = true,
                                shadow = true,
                            },
                            staticcheck = true,
                        },
                    },
                })
            end
			setup("sumneko_lua", {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
                            path = vim.split(package.path, ";"),
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})

			-- null-ls will handle whether it should attach based on it's registered sources.. right?
			-- this should (most importantly) set `on_attach` for null-ls sources
			require("neb.config.plugins.null_ls").setup(options)

            require("neb.config.plugins.rust-tools").setup(options)

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, dopts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, dopts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, dopts)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, dopts)
		end,
	},
}
