return {
	{
		"zbirenbaum/copilot.lua",
		dependencies = { "zbirenbaum/copilot-cmp" },
        enabled = false,
		config = function()
			require("copilot").setup({
				panel = { enabled = false },
				suggestion = {
					enabled = false,
					auto_trigger = true,
					accept = "<C-y>",
				},
			})
		end,
	},
	{
		-- loaded after cmp because I'm not sure Ill keep it 
        -- and this makes it easier to disable
		"zbirenbaum/copilot-cmp",
        lazy = true,
		config = function()
			require("copilot_cmp").setup({
				method = "getCompletionsCycling",
			})
			local has_words_before = function()
				if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
					return false
				end
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
			end

			local cmp = require("cmp")
			local copilot = require("copilot")
			cmp.setup({
				-- mapping = {
				-- 	["<Tab>"] = vim.schedule_wrap(function(fallback)
				-- 		if cmp.visible() then
				-- 			-- and has_words_before() then
				-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				-- 		else
				-- 			fallback()
				-- 		end
				-- 	end),
				-- 	-- ["<C-y>"] = function(fallback)
				-- 	--     if cmp.visi
				-- 	-- end
				-- },
				sorting = {
					priority_weight = 2,
					comparators = {
						-- weights copilot suggestions based on copilots self scoring
						require("copilot_cmp.comparators").score,
						-- alternative prioritizes copilot:
                        -- require("copilot_cmp.comparators").prioritize,

						-- Below is the default comparitor list and order for nvim-cmp
						cmp.config.compare.offset,
						-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
			})
		end,
	},
}
