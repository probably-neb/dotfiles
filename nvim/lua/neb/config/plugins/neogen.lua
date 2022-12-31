return {
    'danymat/neogen',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    keys = { 
        {'<leader>nd', function() require('neogen').generate() end, desc = "Generate Doc Comment", silent = false},
        {'<leader>ncd', function() require('neogen').generate({type = 'class'}) end, desc = "Generate Class Doc Comment", silent = false}
    },
    config = function ()
        require('neogen').setup({
            enabled = true,
            snippet_engine = 'luasnip',
            languages = {
                rust = {
                    template = {
                        annotation_convention = 'rust_alternative'
                    }
                }
            }
        })
    end
}
