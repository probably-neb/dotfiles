-- TODO: swap this and re-goto? (f) (',' <-> ';')
local pre = ","
return {
    "ThePrimeagen/harpoon",
    event = "BufRead",
    keys = { pre },
    config = function()
        -- local autopoon = vim.api.nvim_create_augroup("poon", { clear = true })
        local poon = function(sub, cmd, args)
            return {
                function()
                    require("harpoon." .. sub)[cmd](args)
                end,
                cmd .. "(" .. (args or "") .. ")",
            }
        end

        require("which-key").register({
            m = poon("mark", "add_file"),
            v = poon("ui", "toggle_quick_menu"),
            a = poon("ui", "nav_file", 4),
            s = poon("ui", "nav_file", 3),
            d = poon("ui", "nav_file", 2),
            f = poon("ui", "nav_file", 1),
            }, { prefix = pre, silent = false })
    end,
}
