-- TODO: swap this and re-goto? (f) (',' <-> ';')
local HARPOON_PREFIX = ","
return {
    "ThePrimeagen/harpoon",
    event = "BufRead",
    keys = { HARPOON_PREFIX },
    config = function()
        require('harpoon').setup({
            mark_branch = true
        })

        require("which-key").add({
            {HARPOON_PREFIX, group = "Harpoon"},
            silent = false,
            {HARPOON_PREFIX .. "m", function() require("harpoon.mark").add_file() end, desc = "add_file()"},
            {HARPOON_PREFIX .. "v", function() require("harpoon.ui").toggle_quick_menu() end, desc = "toggle_quick_menu()"},
            {HARPOON_PREFIX .. "a", function() require("harpoon.ui").nav_file(4) end, desc = "nav_file(4)"},
            {HARPOON_PREFIX .. "s", function() require("harpoon.ui").nav_file(3) end, desc = "nav_file(3)"},
            {HARPOON_PREFIX .. "d", function() require("harpoon.ui").nav_file(2) end, desc = "nav_file(2)"},
            {HARPOON_PREFIX .. "f", function() require("harpoon.ui").nav_file(1) end, desc = "nav_file(1)"},
        })
    end,
}
