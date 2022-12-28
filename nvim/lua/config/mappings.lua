local iset = function(...)
	vim.keymap.set("i", ...)
end
local nset = function(...)
	vim.keymap.set("n", ...)
end
local vset = function(...)
	vim.keymap.set("v", ...)
end

vim.g.mapleader = vim.g.neb.leader
vim.g.maplocalleader = vim.g.neb.leader

iset("<Up>", "<Esc>")
-- " spell correction
iset("<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")
iset("<C-k>", "<C-x><C-k>")
-- " newlines w/o insert mode
nset("<C-Enter>", "moO<Esc>`o")
nset("<Enter>","moo<Esc>`o")
-- " visual up down with wrapped lines
nset("j","gj")
nset("gj","j")
nset("k","gk")
nset("gk","k")
nset("<Leader>tc",":VimtexCompile<CR>")

-- move left and right buffers with  h l
nset("<Leader>l",":bn<CR>")
nset("<Leader>h",":bp<CR>")

-- credit @folke
-- slap myself on the wrist for bad habits
for _, key in ipairs({ "h", "j", "k", "l" }) do
	local count = 0
	vim.keymap.set("n", key, function()
		if count >= 10 then
			-- id = vim.notify("Hold it Cowboy!", vim.log.levels.WARN, {
			--   icon = "🤠",
			--   replace = id,
			--   keep = function()
			--     return count >= 10
			--   end,
			-- })
			print("tut tut...")
		else
			count = count + 1
			vim.defer_fn(function()
				if count ~= 0 then
					count = count - 1
				end
			end, 10000)
			return key
		end
	end, { expr = true })
end
-- xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
--
-- function! ExecuteMacroOverVisualRange()
--   echo "@".getcmdline()
--   execute ":'<,'>normal @".nr2char(getchar())
-- endfunction
--
