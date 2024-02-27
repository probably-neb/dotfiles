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
-- }}}
local local_def_node = function(var_name_node, assignment_node)
	return {
		t("local "),
		var_name_node,
		t(" = "),
		assignment_node,
	}
end

local func_node = function()
	return {
		c(1, {
			sn(nil, fmt("function({})", i(1))),
			sn(
				nil,
				fmt("function {}{}({})", {
					c(1, {
						t("M."),
						t(""),
						sn(nil, { i(1), t(".") }),
					}),
					i(2),
					i(3),
				})
			),
		}),
		c(2, {
			sn(nil, { t(" "), res(1, "body"), t(" ") }),
			sn(nil, { t({ "", "\t" }), res(1, "body"), t({ "", "" }) }),
		}),
		t("end"),
	}, {
		stored = {
			["body"] = i(1),
		},
	}
end

-- opted for replacing the "require" text in `last_item_in_path` over t"require('", i(1), t")"
-- because this allows for deduplication of code as well as
-- correctly assigning `var` in
-- local var = require('module').var
local require_nodes = function()
	return {
		t("require('"),
		i(1),
		t("')"),
	}
end

local last_item_in_lua_path = function(node)
	local req_path = node[1][1]
	req_path = vim.fn.substitute(req_path, "require('", "", "")
	req_path = vim.fn.substitute(req_path, "')", "", "")
	local path = req_path
	local no_regex = true
	local modules = vim.split(path, ".", { plain = true })
	local last_item = modules[#modules] or ""
	last_item = vim.fn.substitute(last_item, "-", "_", "g")
	return last_item
end


local recursive_elseif
recursive_elseif = function()
	return sn(nil, {
		c(1, {
			t("end"),
			sn(
				nil,
				fmt(
					[[
            {}
                {}
            {}
            ]],
					{
						f(function(args)
							if args[1][1] == "end" then
								return "else"
							else
								return "elseif"
							end
						end, { 2 }),
						i(1),
						d(2, recursive_elseif),
					}
				)
			),
		}),
	})
end

local snippets = {
	s("ll", sn(1, local_def_node(i(1), i(2)))),
	s("rq", require_nodes()),
	s("rqs", {
		sn(1, require_nodes()),
		t(".setup"),
		c(2, {
			sn(
				nil,
				fmt([[({{
                {}
            }})]], i(1))
			),
            t"()"
		}),
	}),
	s(
		"lrq",
		fmt("local {} = {}", {
			c(2, {
				f(last_item_in_lua_path, { 1 }),
				i(1),
			}),
			sn(1, require_nodes()),
		})
	),
	s("lfn", sn(1, local_def_node(i(1), sn(2, func_node())))),
	-- anonymous function
	s("fn", sn(1, func_node())),
	s(
		"if",
		fmt(
			[[
        if {} then
            {}
        {}
        ]],
			{ i(1), i(2), d(3, recursive_elseif) }
		)
	),
	s("!=", t("~= ")),
	s(
		{ trig = "for (.+) in (.+)", regTrig = true },
		fmt(
			[[
        for {},{} in {}pairs({}) do
            {}
        end
        ]],
			{
				c(1, {
					t("_"),
					i(1, "i"),
				}),
				f(function(_, snip, _)
					return snip.captures[1]
				end),
				c(2, {
					t("i"),
					t(""),
				}),
				f(function(_, snip, _)
					return snip.captures[2]
				end),
				i(3),
			}
		)
	),
	--[[
        this snippet allows for quick namespacing in lua 
        it replaces `var.<func><expand>` with `<global>.func(var|)`
        where global is one of table, string, or vim depending on 
        if the global namespaces have a function of that name.
        if no namespace has a function of that name defaults to
        `|.func(var)` where | is the cursor position
    ]]
	-- postfix({ match_pattern = "[%w%.%_]+$", trig = "%.([%w%_]+)", regTrig = true }, {
	-- 	d(1, function(_, parent)
	-- 		local var_name = parent.env.POSTFIX_MATCH
	-- 		local fn_name = parent.captures[1] or ""
	-- 		local prefix = ""
	-- 		for _, global in ipairs({
	-- 			"string",
	-- 			"table",--[[ , 'vim.fn' ]]
	-- 			"vim",
	-- 		}) do
	-- 			local global_call = global .. "[" .. "'" .. fn_name .. "'" .. "]"
	-- 			local fnbody = "return type(" .. global_call .. ') == "function"'
	-- 			-- this calls the function returned by loadstring which returns if the type of global['fn_name'] is a function
	-- 			if assert(loadstring(fnbody))() then
	-- 				prefix = global
	-- 			end
	-- 		end
	-- 		if prefix == "" then
	-- 			-- index 2 because when prefix
	-- 			-- is found there is
	-- 			-- no jump point for it
	-- 			prefix = i(2)
	-- 		else
	-- 			prefix = t(prefix)
	-- 		end
	-- 		return sn(nil, {
	-- 			prefix,
	-- 			t("." .. fn_name .. "(" .. var_name),
	-- 			i(1),
	-- 			t(")"),
	-- 		})
	-- 	end),
	-- }),
}

local add_snippet = function(snip)
	table.insert(snippets, snip)
end

local blank_equals = function(char, rep)
	local trig = " " .. char .. "="
	-- += replaced with var = var {}
	return postfix({ match_pattern = "[%w%.%_%-]+$", trig = trig }, {
		-- l(vim.fn.substitute(l.POSTFIX_MATCH," $","","") .. " = "),
		l(l.POSTFIX_MATCH .. " = "),
		d(1, rep),
	})
end

add_snippet(blank_equals("f", function(_, parent)
	local POSTFIX_MATCH = parent.env.POSTFIX_MATCH
	return sn(nil, { i(1), t("(" .. POSTFIX_MATCH), i(2), t(")") })
end))
for _, char in ipairs({ "+", "-", "or" }) do
	add_snippet(blank_equals(char, function(_, parent)
		local POSTFIX_MATCH = parent.env.POSTFIX_MATCH
		return sn(nil, {
			t(POSTFIX_MATCH .. " " .. char .. " "),
			i(1),
		})
	end))
end
return snippets
