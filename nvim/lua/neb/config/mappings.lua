local map = function(mode)
	return function(...)
		vim.keymap.set(mode, ...)
	end
end
local imap = map('i')
local nmap = map('n')
local vmap = map('v')
local xmap = map('x')
local cmap = map('c')

local neb = require('neb')
vim.g.mapleader = neb.settings.leader
vim.g.maplocalleader = neb.settings.leader

-- quickly exit insert mode
imap("<Up>", "<Esc>")

-- spell correction
imap("<C-s>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

-- iset("<C-k>", "<C-x><C-k>")
-- " newlines w/o insert mode
-- nmap("<C-Enter>", "moO<Esc>`o")
-- nmap("<Enter>", "moo<Esc>`o")

-- " visual up down with wrapped lines
nmap("j", "gj")
nmap("gj", "j")
nmap("k", "gk")
nmap("gk", "k")

-- move up and down in visual mode
-- credit @ThePrimeagen
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")

-- curson stays in same pos when joining lines
-- credit @ThePrimeagen
nmap("J", "mzJ`z")

-- hitting o while in commented line doesn't automatically insert comment
nmap("o", "o<esc>S")

-- keep cursor centered on scroll
-- credit @ThePrimeagen
nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")

-- keep search term centered
-- credit @ThePrimeagen
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

-- paste forgetting what we replace
-- credit @ThePrimeagen
xmap("<Leader>p", '"_dp')

-- this is embarrassing :(
-- and doesn't work?
nmap("q:",":q")

-- move left and right buffers with  h l
-- nmap("<Leader>l", ":bn<CR>")
-- nmap("<Leader>h", ":bp<CR>")

-- slap myself on the wrist for bad habits
-- credit @folke

local hjkl = { "h", "j", "k", "l" }
local counts = {}

for _, key in ipairs(hjkl) do
	counts[key] = 0
end

local opposites = { h = "l", l = "h", k = "j", j = "k" }
for _, key in ipairs(hjkl) do
	vim.keymap.set("n", key, function()
		local count = 0
		for _, other_key in ipairs(hjkl) do
			count = count + counts[other_key]
		end
		if count >= 5 then
			print("tut tut...")
		else
			counts[key] = counts[key] + 1
			if counts[opposites[key]] ~= 0 then
				counts[opposites[key]] = counts[opposites[key]] - 1
			end
			vim.defer_fn(function()
				if counts[key] ~= 0 then
					counts[key] = counts[key] - 1
				end
			end, 5000)
			return key
		end
	end, { expr = true })
end

-- xmap("@",execute_macro_over_visual_range)
-- local execute_macro_over_visual_range = function()
--     vim.fn.execute(":'<,'>normal @"..vim.fn.nr2char(vim.fn.getchar()))
-- end

-- above lua doesn't work
-- will figure it out when it's not 3am
-- TODO: figure this out
-- for now:
vim.cmd [[
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
]]
