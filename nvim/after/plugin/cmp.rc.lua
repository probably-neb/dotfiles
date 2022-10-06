-- Setup nvim-cmp.
local cmp = require'cmp'

require("cmp_dictionary").setup({
    dic = {
        ["text,markdown"] = { "/usr/share/dict/words" },
        -- ["lua"] = "path/to/lua.dic",
        -- ["javascript,typescript"] = { "path/to/js.dic", "path/to/js2.dic" },
        -- filename = {
        --     ["xmake.lua"] = { "path/to/xmake.dic", "path/to/lua.dic" },
        -- },
        -- filepath = {
        --     ["%.tmux.*%.conf"] = "path/to/tmux.dic"
        -- },
    },
    -- The following are default values, so you don't need to write them if you don't want to change them
    exact = 2,
    first_case_insensitive = false,
    document = false,
    document_command = "wn %s -over",
    async = true,
    capacity = 5,
    debug = false,
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  })
})


cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-n>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<C-p>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items
		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
		-- 	if cmp.visible() then
		-- 		local entry = cmp.get_selected_entry()
		-- 		if not entry then
		-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		-- 		else
		-- 			cmp.confirm()
		-- 		end
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, {"i","s","c",}),
	},
	sources = {
    { name = "copilot" },
		{ name = 'nvim_lsp' },
		{ name = 'ultisnips' }, -- For ultisnips users.
		{ name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'dictionary', keyword_length = 2},
  }
})

