local nvim_lsp = require("lspconfig")

local dopts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, dopts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, dopts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, dopts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, dopts)

local format = function(bufnr)
	if bufnr == nil then
		bufnr = 0
	end
	local null_ls_available = false
	local other_client_names = {}
	for _, client in ipairs(vim.lsp.get_active_clients()) do
		if client.server_capabilities.documentFormattingProvider then
			if client.name == "null-ls" then
				null_ls_available = true
			else
				table.insert(other_client_names, client.name)
			end
		end
	end
	local other_clients_found = false
	local other_clients_list = ""
	if next(other_client_names) ~= nil then
		other_clients_list = table.concat(other_client_names, ", ")
		other_clients_found = true
	end

	local filter = nil
	if null_ls_available then
		filter = function(client)
			return client.name == "null-ls"
		end
		if other_clients_found then
			print("formatting using null-ls instead of:", other_clients_list)
		end
	else
		if other_clients_found then
			print("formatting using:", other_clients_list)
		end
	end
	print(vim.lsp.buf.format({
		filter = filter,
		async = true,
		bufnr = bufnr,
	}))
end
vim.api.nvim_create_user_command("Format", function(_bs)
	format(0)
end, {})
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.

	local opts = { noremap = true, silent = true, buffer = bufnr }
	-- See `:help vim.lsp.*` for documentation on any of the below functions
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
	vim.keymap.set({ "n", "v" }, "<space>a", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<C-b>", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<space>=", function()
		-- vim.lsp.buf.format {async = true}
		format()
		print("poop")
	end, { noremap = true, buffer = bufnr })
end

require("null-ls").setup({
	on_attach = on_attach,
})

-- mason <-> lspconfig names 'https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md'
local protocol_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities(protocol_capabilities)
local flags = { debounce_text_changes = 50 }

local function setup(server, opts)
	opts = opts or {}
	opts.on_attach = opts.on_attach or on_attach
	opts.capabilities = opts.capabilities or capabilities
	opts.flags = opts.flags or flags
	nvim_lsp[server].setup(opts)
end

local no_special_config_servers = { "clangd", "hls" }
for _, server in pairs(no_special_config_servers) do
	setup(server)
end

setup("pyright", {
	single_file_support = true,
})

nvim_lsp.gopls.setup({
	-- cmd = {'gopls'},
	-- for postfix snippets and analyzers
	on_attach = on_attach,
	capabilities = capabilities,
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

local rt = require("rust-tools")
rt.setup({
	server = {
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
			-- rebind lsp.hover() to rust-tools Hover actions
			vim.keymap.set({ "v", "n" }, "<C-h>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- rebind lsp.code_actions() to rust-tools Code action groups
			vim.keymap.set({ "v", "n" }, "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
		flags = {
			debounce_text_changes = 100,
		},
		-- disable rust-analyzer in standalone rust files
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

nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = false,
	-- This sets the spacing and the prefix, obviously.
	virtual_text = {
		spacing = 4,
		-- prefix = ''
	},
	signs = false,
	update_in_insert = true,
})

