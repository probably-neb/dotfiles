return {
	"L3MON4D3/LuaSnip",
	version = "v1.*",
	event = "InsertEnter",
	cmd = {
		"LuaSnipsEdit",
		"LuaSnipsReload",
		"LuaSnipsNewFromPath",
		"LuaSnipsListAvailable",
	},
	config = function()
		local luasnip = require("luasnip")

		local snip_leader = "<leader><leader>"
		local ft_func = require("luasnip.extras.filetype_functions").from_filetype
        local HOME = vim.loop.os_homedir()
		local snippets_dir = HOME .. "/.config/nvim/luasnippets"
		local this_file_path = HOME .. "/.config/nvim/lua/neb/config/plugins/luasnips.lua"
		local Path = require("plenary.path")
		local template_path = Path:new(snippets_dir .. "/.template.lua")
		-- TODO: make an autocmd that copies templates
		-- into buffer when new file opened in snippets dir

		-- config
		luasnip.config.set_config({
			-- remember snippets for jumping back into them
			history = true,
			-- dynamic update of snippets
			update_events = "TextChanged,TextChangedI",
			enable_autosnippets = false,
			-- store visual mode selections
			store_selected_keys = true,
			-- keybind to cut visual mode selection
			-- and store it in SELECT_DEDENT, SELECT_RAW, TM_SELECTED_TEXT
			store_selection_keys = "<TAB>",
			load_ft_func = ft_func,
		})

		local snippet_file = function(key)
			return snippets_dir .. "/" .. key .. ".lua"
		end

		local edit_snippet_file = function(path)
			local p = Path:new(path)
			if not p:exists() then
				local ok = template_path:copy({ destination = p, override = false })
				print("copying template to " .. path)
			end
			-- vim.cmd("edit " .. path)
		end

		local split_current_file_path = function()
			local executing_file_path = vim.fn.stdpath("config") .. "/" .. vim.fn.expand("%:r")
			local all_keys = vim.fn.split(executing_file_path, "/", true)
			local keys = {}
			local num_empty = 0
			for i, key in ipairs(all_keys) do
				if key ~= "" then
					keys[i - num_empty] = key
				else
					num_empty = num_empty + 1
				end
			end
			return keys
		end

		vim.api.nvim_create_user_command("LuaSnipsNewFromPath", function()
			local keys = split_current_file_path()
			vim.ui.select(keys, {
				prompt = "Choose Snippet file name:",
				format_item = function(item)
					return item .. ".lua"
				end,
			}, function(choice)
				edit_snippet_file(snippet_file(choice))
			end)
		end, { desc = "Create a new snippets based on the filepath" })

		-- TODO: save prev file when editing in global var and create command to return to that file
		-- create command to edit snippets
		vim.api.nvim_create_user_command("LuaSnipsEdit", function()
			local ft = ft_func()[1]
			local filetype_path = snippet_file(ft)
			local path_set = {}
			path_set[filetype_path] = true
			local parts = split_current_file_path()
			for _, path_entry in ipairs(parts) do
				local path_entry = snippet_file(path_entry)
				local path = Path:new(path_entry)
				if path:is_file() then
					path_set[path_entry] = true
				end
			end
			local paths = {}
			for path, _ in pairs(path_set) do
				table.insert(paths, path)
			end
			local chosen_path = nil
			if #path_set == 1 then
				print("Only 1 choice")
				chosen_path = paths[1]
			else
				local shorten_path = function(p)
					return vim.fn.fnamemodify(p, ":t")
				end
				vim.ui.select(
					paths,
					{ prompt = "Multiple Paths Found, Choose Desired Snippet File:", format_item = shorten_path },
					function(choice)
						-- print(choice_map[choice])
						chosen_path = choice
					end
				)
			end
			-- local vim.fn.expand()
			edit_snippet_file(chosen_path)
			-- require("luasnip.loaders").edit_snippet_files({ edit = error })
		end, { desc = "edit luasnips snippets" })

		-- and keybind
		vim.keymap.set("n", snip_leader .. "e", "<cmd>LuaSnipsEdit<cr>", { silent = false })

        local load_snippets = function()
            require("luasnip.loaders.from_lua").load({ paths = snippets_dir })
        end
		local reload_snippets = function()
			-- local current_file_path = this_file_path
			-- print("reloading luasnips config at:", current_file_path)
			-- vim.fn.execute("source " .. current_file_path)
            load_snippets()
		end

		-- create command to reload snippets
		vim.keymap.set("n", "<leader><leader>s", reload_snippets)
		-- and a command to because why not
		vim.api.nvim_create_user_command("LuaSnipsReload", reload_snippets, { desc = "reload luasnips snippets" })

		-- load all lua snippets
        load_snippets()
	end,
	enable_autosnippets = function()
		-- taken from config.lua in luasnips source
		-- autocmd InsertCharPre * lua Luasnip_just_inserted = true
		-- autocmd TextChangedI,TextChangedP * lua if Luasnip_just_inserted then require("luasnip").expand_auto() Luasnip_just_inserted=nil end
		local luasnip = require("luasnip")
		local session = require("luasnip.session")
		session.config.enable_autosnippets = true

		vim.api.nvim_create_autocmd({ "InsertCharPre" }, {
			group = "luasnip",
			pattern = "*",
			callback = function()
				session.just_inserted = true
			end,
		})
		vim.api.nvim_create_autocmd({ "TextChangedI", "TextChangedP" }, {
			group = "luasnip",
			pattern = "*",
			callback = function()
				if session.just_inserted then
					luasnip.expand_auto()
					session.just_inserted = false
				end
			end,
		})
	end,
}
