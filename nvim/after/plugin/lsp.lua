-- lua << EOF

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)


  require'completion'.on_attach(client, bufnr)

  --protocol.SymbolKind = { }
  protocol.CompletionItemKind = {
    '???', -- Text
    '???', -- Method
    '???', -- Function
    '???', -- Constructor
    '???', -- Field
    '???', -- Variable
    '???', -- Class
    '???', -- Interface
    '???', -- Module
    '???', -- Property
    '???', -- Unit
    '???', -- Value
    '???', -- Enum
    '???', -- Keyword
    '???', -- Snippet
    '???', -- Color
    '???', -- File
    '???', -- Reference
    '???', -- Folder
    '???', -- EnumMember
    '???', -- Constant
    '???', -- Struct
    '???', -- Event
    '???', -- Operator
    '???', -- TypeParameter
  }
end

--Enable (broadcasting) snippet capability for completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- local coq = require('coq').lsp_ensure_capabilities
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = {'pyright', 'bashls', 'html', 'jsonls', 'cssls'}
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
-- 		-- coq {
-- 			on_attach = on_attach,
-- 			flags = {
-- 				debounce_text_changes = 150,
-- 			},
-- 			capabilities = capabilities
-- 		-- }
--   }
-- end

-- nvim_lsp.diagnosticls.setup {
	-- coq {
		-- on_attach = on_attach,
		-- filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
		-- init_options = {
		-- linters = {
			-- eslint = {
			-- command = 'eslint_d',
			-- rootPatterns = { '.git' },
			-- debounce = 100,
			-- args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
			-- sourceName = 'eslint_d',
			-- parseJson = {
				-- errorsRoot = '[0].messages',
				-- line = 'line',
				-- column = 'column',
				-- endLine = 'endLine',
				-- endColumn = 'endColumn',
				-- message = '[eslint] ${message} [${ruleId}]',
				-- security = 'severity'
			-- },
			-- securities = {
				-- [2] = 'error',
				-- [1] = 'warning'
			-- }
			-- },
		-- },
		-- filetypes = {
			-- javascript = 'eslint',
			-- javascriptreact = 'eslint',
			-- typescript = 'eslint',
			-- typescriptreact = 'eslint',
		-- },
		-- formatters = {
			-- eslint_d = {
			-- command = 'eslint_d',
			-- args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
			-- rootPatterns = { '.git' },
			-- },
			-- prettier = {
			-- command = 'prettier',
			-- args = { '--stdin-filepath', '%filename' }
			-- }
		-- },
		-- formatFiletypes = {
			-- css = 'prettier',
			-- javascript = 'eslint_d', javascriptreact = 'eslint_d', json = 'prettier',
			-- scss = 'prettier',
			-- less = 'prettier',
			-- typescript = 'eslint_d',
			-- typescriptreact = 'eslint_d',
			-- json = 'prettier',
			-- markdown = 'prettier',
		-- },
		-- capabilities = capabilities
		-- }
	-- }
-- }

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = '???'
    },
		update_in_insert = true
  }
)
-- EOF
