--vim: foldlevel=0
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

local block = function(idx, body)
	body = body or i(1, "body")
	return sn(
		idx,
		fmta(
			[[{
    <>
}]],
			body
		)
	)
end

local mut = function(idx, opts)
	opts = opts or {}
	local filler = opts.filler or "var"
	local var = function(idx)
		return res(idx, "var", i(1, filler))
	end
	return c(idx, {
		var(),
		sn(nil, { t("mut "), var(1) }),
	})
end

local or_block = function(idx, content)
	return c(idx, {
		res(nil,"body",i(1,content)),
		block(nil, res(1,"body",i(1,content))),
	})
end

local let = function(opts)
	opts = opts or {}
	local nodes = {
		t("let "),
		mut(1),
		t(" = "),
        or_block(2, "value"),
	}
	if opts.semi then
		table.insert(nodes, t(";"))
	end
	return nodes
end

local pub = function(idx, txt)
    txt = txt.." "
	return c(idx, {
		t(txt),
		sn(nil, t("pub(crate) " .. txt)),
		sn(nil, t("pub " .. txt)),
	})
end


local recursive_fields
recursive_fields = function()
	return sn(nil, {
		c(1, {
			t(","),
			sn(
				nil,
				fmt(
					[[{},{}
            ]],
					{
						i(1),
						d(2, recursive_fields),
					}
				)
			),
		}),
	})
end

local snippets = {
	s("let", sn(1, let({ semi = true }))),
	s("fn", {
		pub(1, "fn"),
		i(2, "name"),
		t("("),
		i(3, "args"),
		t(")"),
		c(4, {
			sn(nil, { t(" -> "), i(1, "/* return type */") }),
			t(""),
		}),
		t(" "),
		block(5),
	}),
	s("mut", mut(1)),
    s("struct",{
        pub(1, "struct"),
        block(2, d(1,recursive_fields))
    })
}
return snippets
