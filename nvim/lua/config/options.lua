vim.g.mapleader = vim.g.neb.leader
vim.g.maplocalleader = vim.g.neb.leader

-- general
vim.opt.grepprg = "rg --vimgrep"
-- ?
vim.opt.ruler = true
vim.opt.signcolumn = "no"
-- sync with system clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.spelllang = "en_us"
-- vim.opt.shada = true
vim.opt.wrap = true
vim.opt.updatetime = 50
vim.opt.conceallevel = 3
vim.opt.completeopt = "menu,menuone,noselect"
-- set t_Co=256
-- let &t_ut=''

-- undofile over shada
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undolevels = 10000
local path = require("plenary.path"):new(vim.fn.stdpath("data") .. "/undodir")
if not path:is_dir() then
	path:mkdir()
end
vim.opt.undodir = tostring(path)

-- fix py
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/bin/python3"

-- colors
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80" 
-- vim.opt.syntax = true
vim.g.rainbow_active = 1

-- indents
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.tabstop = vim.g.neb.indent
vim.opt.softtabstop = vim.g.neb.indent
vim.opt.shiftwidth = vim.g.neb.indent
vim.opt.expandtab = true
vim.opt.shiftround = true

-- case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- search
vim.opt.incsearch = true
vim.opt.hlsearch = false
-- vim.opt.nohlsearch = true

-- incremental substitution
vim.opt.inccommand = "nosplit"

-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- movement
vim.opt.scrolloff = 8
vim.opt.scroll = 10
vim.opt.mouse = "a"

-- modelines
vim.opt.modeline = true
vim.opt.modelines = 2

-- markdown code block syntax highlighting
local fences = {
	"lua",
	"json",
	"typescript",
	"javascript",
	"js=javascript",
	"ts=typescript",
	"shell=sh",
	"python",
	"sh",
	"console=sh",
}
vim.g.markdown_fenced_languages = fences
vim.g.markdown_recommended_style = 0

-- legacy (remember vimscript? I don't!)

-- setlocal spell spelllang=en_us
-- if (has("termguicolors"))
-- 	set termguicolors
-- 	set t_Co=256
-- 	syntax enable
-- 	let &t_ut=''
-- 	syntax enable
-- 	set pumblend=5
-- 	set wildoptions=pum
-- 	set winblend=0
-- endif
-- filetype plugin indent on
-- syntax enable

-- set updatetime=100
