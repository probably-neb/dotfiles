-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
	vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
end
vim.opt.rtp:prepend(lazypath)

local M = {}

require('lazy').setup('neb.config.plugins', {
    install = {colorscheme = {"tokyonight"}},
    defaults = {
        lazy = true,
    },
    dev = {
        path = "~/code/exploring/",
        fallback = true,
    }
})

function M.is_plugin_loaded(plugin_name)
    local plugin = require('lazy.core.config').plugins[plugin_name]
    -- returns nil when plugin doesn't exits, otherwise true/false
    return (plugin and plugin._.loaded) and true
end

return M
