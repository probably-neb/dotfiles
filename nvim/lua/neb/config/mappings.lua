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

-- I don't have an 8 key anymore...
-- imap("\\x", "*");
-- imap("\\9", "8");

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
nmap("o", 'o<esc>"_S')

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

-- move ldur tabs with <leader>hjkl
nmap("<Leader>h", "<C-w>h")
nmap("<Leader>j", "<C-w>j")
nmap("<Leader>k", "<C-w>k")
nmap("<Leader>l", "<C-w>l")
-- note to self: HJKL move windows around
nmap("<Leader>H", "<C-w>H")
nmap("<Leader>J", "<C-w>J")
nmap("<Leader>K", "<C-w>K")
nmap("<Leader>L", "<C-w>L")
-- slap myself on the wrist for bad habits
-- credit @folke

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
