-- vim:foldmethod=marker:foldlevel=0

-- nebvim

-- blazingly
-- require('impatient')


require('neb.config.options')
require('neb.config.mappings')
-- require('neb.config.packer')
require('neb.config.lazy')
require('neb.config.commands')

-- vim.cmd [[ colorscheme tokyonight ]]
vim.cmd [[ colorscheme base16 ]]

-- autocmd Bufread,BufNewFile *.h set filetype=c 
