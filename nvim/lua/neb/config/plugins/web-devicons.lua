local M = {
	"nvim-tree/nvim-web-devicons",
}

M.setup = function()
	require("nvim-web-devicons").setup({
		-- your personnal icons can go here (to override)
		-- DevIcon will be appended to `name`
		protocol = {
			SymbolKind = {},
			CompletionItemKind = {
				"", -- Text
				"", -- Method
				"", -- Function
				"", -- Constructor
				"", -- Field
				"", -- Variable
				"", -- Class
				"ﰮ", -- Interface
				"", -- Module
				"", -- Property
				"", -- Unit
				"", -- Value
				"", -- Enum
				"", -- Keyword
				"﬌", -- Snippet
				"", -- Color
				"", -- File
				"", -- Reference
				"", -- Folder
				"", -- EnumMember
				"", -- Constant
				"", -- Struct
				"", -- Event
				"ﬦ", -- Operator
				"", -- TypeParameter
			},
		},
		-- override = {},
		-- globally enable default icons (default to false)
		-- will get overriden by `get_icons` option
		-- default = true,
	})
end

return M
