-- vim: foldmethod=marker 
-- vim: foldlevel=0
-- nebvim

vim.g.neb = { leader = ' ', indent = 4 }
require('impatient')

require('config.options')
require('config.mappings')

require('config.plugins')

vim.cmd [[ colorscheme base16 ]]

-- autocmd Bufread,BufNewFile *.h set filetype=c 

function P(...)
    print(vim.inspect(...))
end

-- FIXME: intro screen not showing. Shows with `nvim --noplugin`
-- bandaid solution:
-- vim.cmd [[ exec ":intro" ]]
