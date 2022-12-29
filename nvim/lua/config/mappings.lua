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
iset("<C-s>", "<c-g>u<Esc>[s1z=`]a<c-g>u")
-- iset("<C-k>", "<C-x><C-k>")
-- " newlines w/o insert mode
nset("<C-Enter>", "moO<Esc>`o")
nset("<Enter>", "moo<Esc>`o")
-- " visual up down with wrapped lines
nset("j", "gj")
nset("gj", "j")
nset("k", "gk")
nset("gk", "k")
nset("<Leader>tc", ":VimtexCompile<CR>")

-- move left and right buffers with  h l
nset("<Leader>l", ":bn<CR>")
nset("<Leader>h", ":bp<CR>")

-- credit @folke
-- slap myself on the wrist for bad habits
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
			-- id = vim.notify("Hold it Cowboy!", vim.log.levels.WARN, {
			--   icon = "🤠",
			--   replace = id,
			--   keep = function()
			--     return count >= 10
			--   end,
			-- })
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
-- xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
--
-- function! ExecuteMacroOverVisualRange()
--   echo "@".getcmdline()
--   execute ":'<,'>normal @".nr2char(getchar())
-- endfunction
--
