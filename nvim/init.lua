-- vim:foldmethod=marker:foldlevel=0

-- nebvim

-- blazingly
require('impatient')

require('neb.config.options')
require('neb.config.mappings')

require('neb.config.packer')

vim.cmd [[ colorscheme base16 ]]
vim.cmd [[ colorscheme tokyonight ]]

-- autocmd Bufread,BufNewFile *.h set filetype=c 

function P(...)
    print(vim.inspect(...))
end

-- TODO: intro screen not showing. Shows with `nvim --noplugin`
-- bandaid solution:
-- vim.cmd [[ exec ":intro" ]]
