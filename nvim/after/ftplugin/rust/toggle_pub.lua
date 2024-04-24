local ok, api = pcall(require, "Comment.api")
if not ok then
    return
end

-- returns a copy of the current config
local get_toggle_config = function()
    local config = require("Comment.config")
    local pre_hook = function(_)
        return "pub %s"
    end
    config.pre_hook = pre_hook
    config.padding = true

    return config
end
local toggle_pub_n = function()
    local config = get_toggle_config()
    api.toggle.linewise(nil, config)
end
local toggle_pub_v = function()
    local config = get_toggle_config()
    local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
    vim.api.nvim_feedkeys(esc, "nx", false)
    api.toggle.linewise(vim.fn.visualmode(), config)
end
---- Toggle selection (linewise)
-- vim.keymap.set("x", "<leader>p", toggle_pub_v, { silent = false })
-- vim.keymap.set("n", "<Leader>p", toggle_pub_n, { silent = false })
require("which-key").register({
    p = {toggle_pub_n, "Toggle Pub in normal mode"},
}, {prefix="<leader><leader>", mode ="n"})
require("which-key").register({
    p = {toggle_pub_v, "Toggle Pub in visual mode", {mode ="x"}},
}, {prefix="<leader><leader>", mode ="x"})
-- vim.keymap.set("v", "<Leader>p", toggle_pub_v, { silent = false })
