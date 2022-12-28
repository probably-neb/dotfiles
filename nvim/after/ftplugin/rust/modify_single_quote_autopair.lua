local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
    return
end
local conds = require("nvim-autopairs.conds")
-- autopairs.gerequire("nvim-autopairs.conds")t_rule("'")[2].not_filetypes = { "rust" }
-- not rust rule = get_rule[1]
-- rust rule = get_rule[2]
autopairs.get_rule("'")[2]:with_pair(conds.not_before_text("+ "))
