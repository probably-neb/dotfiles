local luasnip = require("luasnip")

local ft_func = require("luasnip.extras.filetype_functions").from_filetype
local snippets_dir = "~/.config/nvim/lua/plugins"
-- config
luasnip.config.set_config({
	-- remember snippets for jumping back into them
	history = true,
	-- dynamic update of snippets
	update_events = "TextChanged,TextChangedI",
	enable_autosnippets = false,
	-- store visual mode selections
	store_selected_keys = true,
	load_ft_func = ft_func,
})

-- jump and select keymaps are defined in cmp rc

-- create command to edit snippets
vim.api.nvim_create_user_command("LuaSnipsEdit", function()
    local ft = ft_func()[1]
    local fp = snippets_dir .. '/' .. ft .. '.lua'
    vim.cmd("edit ".. fp)
	-- require("luasnip.loaders").edit_snippet_files({ edit = error })
end, { desc = "edit luasnips snippets" })

-- function to re-source this file
local reload_snippets = function()
	vim.fn.execute("source ".. snippets_dir .. "/luasnips.lua")
end
-- create command to reload snippets
vim.keymap.set("n", "<leader><leader>s", reload_snippets)
-- and a command to because why not
vim.api.nvim_create_user_command("LuaSnipsReload", reload_snippets, { desc = "reload luasnips snippets" })

-- load all lua snippets
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
