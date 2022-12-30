-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
	-- add any options here, or leave empty to use the default settings
})

local nvim_lsp = require("lspconfig")
local dopts = { noremap = true, silent = true }
local format = require("neb.plugins.lsp.format")

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
		format.format()
	end, { noremap = true, buffer = bufnr })

	vim.api.nvim_create_user_command("Format", function(_bs)
		format.format()
	end, {})

	lsp_status.on_attach(client)
end

local protocol_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities(protocol_capabilities)
vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
local flags = { debounce_text_changes = 50 }

local function setup(server, opts)
	opts = opts or {}
	opts.on_attach = opts.on_attach or on_attach
	opts.capabilities = opts.capabilities or capabilities
	opts.flags = opts.flags or flags
	nvim_lsp[server].setup(opts)
end

setup("hls")
setup("clangd", { handlers = lsp_status.extensions.clangd.setup() })
setup("pyright", { single_file_support = true })
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
setup("sumneko_lua", {
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
-- setup null-ls
-- null-ls will handle whether it should attach based on it's registered sources
-- right?
-- this should (most importantly) set `on_attach` for null-ls sources
setup("null-ls")

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
		flags = flags,
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

-- mason <-> lspconfig names 'https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md'

-- global diagnostic settings
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

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, dopts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, dopts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, dopts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, dopts)
