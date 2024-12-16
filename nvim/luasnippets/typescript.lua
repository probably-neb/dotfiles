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
local ts_utils = require('nvim-treesitter.ts_utils')
-- }}}

ls.filetype_extend('typescriptreact', {'typescript'})


local get_function_name = function()
  local node = ts_utils.get_node_at_cursor().parent
  while node do
    if node:type() == "call_expression" then
      local func_name = ""
      for child in node:iter_children() do
        if child:type() == "member_expression" or child:type() == "identifier" then
          func_name = vim.treesitter.get_node_text(child, 0)
          break
        end
      end
      return func_name
    end
    node = node:parent()
  end
  return ""
end

local snippets = {
	s(
		"eaf",
		fmt(
			[[export async function {}({}) {{
    {}
}}]],
			{
				i(1),
				i(2),
				i(3),
			}
		)
	),
	s(
		"ec",
		fmt([[export const {} = {}]], {
			i(1),
			i(2),
		})
	),
	s(".catchpromise", {
		t({ "", ".catch((e): Awaited<ReturnType<typeof " }),
        i(1),
		--[[ f(function()
			return get_function_name()
		end), ]]
		t({ ">> => {", "\tconsole.error('uncaught error in " }),
        r(1),
		--[[ f(function()
			return get_function_name()
		end), ]]
		t({ "', e);" }),
		c(2, {t("", {"\treturn {", "\t\tok: false,", "\t\treason: 'internal-server-error'"}), i(2)}),
		t({ ",", "\t};", "});" }),
	}),
}
return snippets
