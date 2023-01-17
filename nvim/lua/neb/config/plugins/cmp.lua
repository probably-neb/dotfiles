-- cmp stuff
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lua",
		"saadparwaiz1/cmp_luasnip",
		"uga-rosa/cmp-dictionary",
		-- { "mtoohey31/cmp-fish", ft = "fish" },
	},
	config = function()
		-- Setup nvim-cmp.
		local cmp = require("cmp")

		local function if_cmp_visible_do(thing_todo, args)
			return function(fallback)
				if cmp.visible() then
					thing_todo(args)
				else
					fallback()
				end
			end
		end

		local luasnip = require("luasnip")
		cmp.setup({

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},

			mapping = {
				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
				-- ["<C-Enter>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<TAB>"] = cmp.mapping({
					c = if_cmp_visible_do(cmp.complete_common_string),
					i = if_cmp_visible_do(cmp.confirm, { select = true }),
				}),
				["<C-n>"] = cmp.mapping(if_cmp_visible_do(cmp.select_next_item), { "i", "c" }),
				["<C-p>"] = cmp.mapping(if_cmp_visible_do(cmp.select_prev_item), { "i", "c" }),
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				-- TODO: move luasnips bindings to luasnips rc
				["<C-l>"] = function(fallback)
					if luasnip.choice_active() then
						luasnip.change_choice(1)
					else
						fallback()
					end
				end,
				-- ["<C-y>"] = if_cmp_visible_do(cmp.complete({
				-- 	-- limit completion options to copilot
				-- 	config = { sources = { { name = "copilot" } } },
				-- })),
				["<C-j>"] = function(fallback)
					if cmp.visible() then
						cmp.complete({
							-- limit completion options to snippets
							config = { sources = { { name = "luasnips" } } },
						})
						-- auto complete first snippet option
						-- unconditionally take the first one or whatever we're on now
						cmp.confirm({ select = true })
					end
					if luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end,
				["<C-k>"] = function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end,
				-- complete but only snippets
			},
			-- double {{}} for group index sorting
			sources = {
				{ name = "copilot" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "nvim_lua" },
				{ name = "nvim_lsp" },
				{ name = "buffer", keyword_length = 5 },
				{ name = "path" },
				{ name = "dictionary", keyword_length = 5 },
				{ name = "fish" },
			},

			completion = {
				keyword_length = 3,
			},

			experimental = {
				native_menu = false,
				ghost_text = true,
			},

			formatting = {
				format = function(entry, vim_item)
					vim_item.menu = ({
						copilot = "[]",
						buffer = "[buf]",
						nvim_lsp = "[lsp]",
						nvim_lua = "[lua]",
						path = "[path]",
						luasnip = "[snip]",
						dictionary = "[dict]",
						nvim_lsp_signature_help = "[lsp sig]",
						cmdline = "[cmd]",
						crates = "[crates]",
					})[entry.source.name]
					return vim_item
				end,
			},
		})
		cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

		require("cmp_dictionary").setup({
			dic = {
				["text,markdown,latex"] = { "/usr/share/dict/words" },
			},
		})

		-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline("/", {
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			sources = {
				{ name = "path" },
				{ name = "cmdline" },
			},
		})

        -- this is a dirty way to make sure copilot_cmp is loaded after
        -- see it's configuration to know why it is loaded after
		-- require("copilot_cmp")
	end,
}
