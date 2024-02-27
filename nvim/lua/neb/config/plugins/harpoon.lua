-- TODO: swap this and re-goto? (f) (',' <-> ';')
local pre = ","
return {
    "ThePrimeagen/harpoon",
    event = "BufRead",
    keys = { pre },
    config = function()
        require('harpoon').setup({
            mark_branch = true
        })

        require("which-key").register({
            m = {function() require("harpoon.mark").add_file() end, "add_file()"},
            v = {function() require("harpoon.ui").toggle_quick_menu() end, "toggle_quick_menu()"},
            a = {function() require("harpoon.ui").nav_file(4) end, "nav_file(4)"},
            s = {function() require("harpoon.ui").nav_file(3) end, "nav_file(3)"},
            d = {function() require("harpoon.ui").nav_file(2) end, "nav_file(2)"},
            f = {function() require("harpoon.ui").nav_file(1) end, "nav_file(1)"},
        }, { prefix = pre, silent = false })
    end,
}
