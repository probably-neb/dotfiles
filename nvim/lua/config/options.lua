vim.g.mapleader = vim.g.neb.leader
vim.g.maplocalleader = vim.g.neb.leader
-- syntax enable

-- general
vim.o.grepprg = "rg --vimgrep"
-- ?
vim.o.ruler = true
-- sync with system clipboard
vim.o.clipboard = "unnamedplus"
vim.o.spelllang = "en_us"
vim.o.shada = true
vim.o.wrap = true
vim.o.updatetime = 200
vim.o.conceallevel = 3
vim.o.completeopt = "menu,menuone,noselect"
-- set t_Co=256
-- let &t_ut=''

-- undo 
vim.o.undofile = true
vim.o.undolevels = 10000
-- fix py 
-- if has('nvim') && !empty($CONDA_PREFIX)
-- let g:python3_host_prog = '/home/neb/anaconda3/envs/cp-knowledge-graph/bin/python'
vim.g.python_host_prog = '/usr/bin/python'
vim.g.python3_host_prog = '/usr/bin/python3'
-- colors
vim.o.termguicolors = true
vim.o.syntax = true
vim.g.rainbow_active = 1

-- indents
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.smarttab = true
vim.o.breakindent = true
vim.o.tabstop = vim.g.neb.indent
vim.o.shiftwidth = vim.g.neb.indent
vim.o.expandtab = true
vim.o.shiftround = true

-- case
vim.o.ignorecase = true
vim.o.smartcase = true

-- search
vim.o.incsearch = true
vim.o.nohlsearch = true

-- incremental substitution
vim.o.inccommand = "nosplit"

-- line numbers
vim.o.relativenumber = true
vim.o.number = true

-- movement
vim.o.scrolloff = 10
vim.o.mouse = "a"

-- modelines
vim.o.modeline = true
vim.o.modelines = 2

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
