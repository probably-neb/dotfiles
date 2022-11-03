-- require("nvim-lsp-installer").setup {}
local nvim_lsp = require('lspconfig')

-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<C-b>', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>=', '<cmd>lua vim.lsp.buf.format {async = true}<CR>', opts)


  -- require'completion'.on_attach(client, bufnr)

end

--Enable (broadcasting) snippet capability for completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

require("nvim-lsp-installer").setup {}
-- Setup lspconfig.
local lspconfig = require 'lspconfig'
local protocol_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(protocol_capabilities)


local servers = {'clangd', 'hls'}
for _, lsp in pairs(servers) do
  nvim_lsp[lsp].setup {
  -- server:on_ready(function(server)
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 50
    }
  }
end

nvim_lsp.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 50
  },
  single_file_support = true
})

nvim_lsp.gopls.setup{
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
}

local rt = require("rust-tools")
rt.setup({
  server = {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      on_attach(client,bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    flags = {
      debounce_text_changes = 50
    },
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          allFeatures = true,
          overrideCommand = {
            'cargo', 'clippy', '--workspace', '--message-format=json',
            '--all-targets', '--all-features', '--', '-A', 'clippy::needless_return'
          }
        }
      }
    }
  },
})

nvim_lsp.sumneko_lua.setup({
  settings = {
    Lua = {
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      globals = { 'vim' },
    },
    workspace = {
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
  },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      -- prefix = ''
    },
    signs = false,
		update_in_insert = true
  }
)
