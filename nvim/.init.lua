-- LSP {{{ 

-- require("nvim-lsp-installer").setup {}
local nvim_lsp = require('lspconfig')

-- on_attach {{{ 
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
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<C-b>', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)


  -- require'completion'.on_attach(client, bufnr)

  -- protocol.SymbolKind = { }
  -- protocol.CompletionItemKind = {
  --   '', -- Text
  --   '', -- Method
  --   '', -- Function
  --   '', -- Constructor
  --   '', -- Field
  --   '', -- Variable
  --   '', -- Class
  --   'ﰮ', -- Interface
  --   '', -- Module
  --   '', -- Property
  --   '', -- Unit
  --   '', -- Value
  --   '', -- Enum
  --   '', -- Keyword
  --   '﬌', -- Snippet
  --   '', -- Color
  --   '', -- File
  --   '', -- Reference
  --   '', -- Folder
  --   '', -- EnumMember
  --   '', -- Constant
  --   '', -- Struct
  --   '', -- Event
  --   'ﬦ', -- Operator
  --   '', -- TypeParameter
  -- }
end
-- }}}

-- Setup lspconfig.
local lspconfig = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_installer = require("nvim-lsp-installer")


nvim_lsp.sumneko_lua.setup({
  settings = {
    Lua = {
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      globals = {'vim'},
    },
    workspace = {
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
  },
})
-- }}}
-- previous server configs {{{
-- lsp_installer.on_server_ready(function(server)
--   local opts = {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
--   server:setup(opts)
-- end)

-- lsp_installer.on_server_ready(function(lsp)
-- 	lspconfig[lsp].setup {
-- 		on_attach = on_attach,
-- 		capabilities = capabilities
-- 	}
-- end)

-- local servers = require("nvim-lsp-installer.servers").get_installed_servers()
-- local servers = lsp_installer.get_installed_servers()
-- sumneko_lua {{{

-- local servers = { 'sumenko_lua' }
-- for _, server in ipairs(servers) do
--   -- server:on_ready(function(server)
--     local opts = {
--       on_attach = on_attach,
--       capabilities = capabilities,
--     }
--     server:setup(opts)
--     -- lspconfig[server].setup {opts}
--   -- end)
-- end

-- local servers = { 'bashls', 'html', 'jsonls'}
-- for _, lsp in ipairs(servers) do
-- 	lspconfig[lsp].setup {
-- 		on_attach = on_attach,
-- 		capabilities = capabilities
-- 	}
-- end


-- icon
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline = true,
--     -- This sets the spacing and the prefix, obviously.
--     virtual_text = {
--       spacing = 4,
--       prefix = ''
--     },
-- 		update_in_insert = true
--   }
-- )
-- }}}
-- }}}
