-- function to print vim.inspect info quickly
function P(...)
	print(vim.inspect(...))
end

function requiref(modname)
	package.loaded[modname] = nil
	return require(modname)
end

local function reload_plugin(plugin_name)
	if type(plugin_name) == "table" then
		plugin_name = plugin_name[1]
	end
	local plugin = require("lazy.core.config").plugins[plugin_name]
	if plugin == nil then
		plugin = require("lazy.core.loader").load(plugin_name)
	else
		plugin = require("lazy.core.loader").reload(plugin)
	end
	return plugin
end

vim.api.nvim_create_user_command("Reload", reload_plugin, { nargs = 1 })

vim.api.nvim_create_user_command("WordCount", function()
	local word_count = vim.fn.wordcount()
	print(string.format("%s words", word_count.words))
end, {})

function Scratch(file_name)
    local tmp_file =  "/tmp/" .. file_name
    local exe_exts = {".py",".sh"}
    local f = io.open(tmp_file)
    for _, exe_ext in ipairs(exe_exts) do
        if vim.endswith(tmp_file, exe_ext) then
            os.execute("chmod +x " .. tmp_file)
        end
    end
    vim.fn.execute(string.format("e %s",tmp_file))
end
