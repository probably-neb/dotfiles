-- vim:foldmethod=marker:foldlevel=0

-- nebvim

-- some global settings I'd like applied everywhere
vim.g.neb = { leader = ' ', indent = 4 }

-- blazingly
require('impatient')

require('config.options')
require('config.mappings')

require('config.packer')

vim.cmd [[ colorscheme base16 ]]
vim.cmd [[ colorscheme tokyonight ]]

-- autocmd Bufread,BufNewFile *.h set filetype=c 

function P(...)
    print(vim.inspect(...))
end

-- TODO: intro screen not showing. Shows with `nvim --noplugin`
-- bandaid solution:
-- vim.cmd [[ exec ":intro" ]]
