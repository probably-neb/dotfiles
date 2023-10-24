-- vim: foldlevel=0
-- vim: foldmethod=marker
-- preamble {{{
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local res = ls.restore_node
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")
local isn = ls.indent_snippet_node
local postfix = require("luasnip.extras.postfix").postfix
local events = require("luasnip.util.events")
local add_snippet = function(snip)
	table.insert(snippets, snip)
end
-- }}}

local snippets = {
    s("rb", fmta([[
```{r}
<>
```]], i(1))),
    s("!echo", t"#| echo: false")
}
return snippets
