vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)

   use 'wbthomason/packer.nvim'

   use {'/home/neb/code/nvim-rustdocs', rocks='htmlparser' }

   -- lsp, mason?, lints, daps, oh my!
   use {
      'williamboman/mason-lspconfig.nvim',
      {'williamboman/mason.nvim',
         config = function()
            require('mason').setup {
               log_level = vim.log.levels.DEBUG
            }
            require('mason-lspconfig').setup()
         end
      },
      'neovim/nvim-lspconfig',
      'nvim-lua/lsp-status.nvim',
      'rmagatti/goto-preview',
      'mfussenegger/nvim-lint',
      'mfussenegger/nvim-dap'
   }
   -- -- cmp stuff
   use {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'quangnguyen30192/cmp-nvim-ultisnips',
      'uga-rosa/cmp-dictionary',
   }

   use {'lukas-reineke/indent-blankline.nvim',
      config = function()
         vim.opt.list = true
         -- vim.opt.listchars:append "space:⋅"
         require('indent_blankline').setup {
            -- char = "",
            space_char_blankline = " ",
            show_trailing_blankline_indent = false,
         }

         local color = vim.g.colors.base02
         vim.cmd (
            'highlight IndentBlanklineChar guifg='
            .. color
            .. " gui=nocombine"
         )
         vim.cmd (
            'highlight IndentBlanklineSpaceChar guifg='
            .. color
            .. " gui=nocombine"
         )
      end
   }

   -- use 'zbirenbaum/copilot.lua'
   -- -- find way to load after
   -- use 'zbirenbaum/copilot-cmp'

   use 'nvim-lua/plenary.nvim'

   use 'glepnir/lspsaga.nvim'

   use {
      {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'},
      'nvim-treesitter/playground'
   }

   use 'nvim-telescope/telescope.nvim'

   use 'BurntSushi/ripgrep'

   use 'nvim-lua/popup.nvim'

   use 'windwp/nvim-autopairs'

   use 'wellle/targets.vim' -- god this plugin is fucking amazing

   -- tpope corner
   use {
      'tpope/vim-commentary',
      'tpope/vim-surround',
      'tpope/vim-abolish',
   }

   use {'morhetz/gruvbox',
      config = function()
        vim.g.gruvbox_contrast_light='hard'
      end , opt=true
   }

   use {'dag/vim-fish', ft={'fish'}}

   -- use {'simrat39/rust-tools.nvim', ft = {'rs'}}
   use {'simrat39/rust-tools.nvim'}

   use {'SirVer/ultisnips', config = 
     function()
        vim.cmd([[ let g:UltiSnipsEnableSnipMate = 0 ]])
        vim.cmd([[ let g:UltiSnipsSnippetDirectories=['/home/neb/dotfiles/nvim/UltiSnips/'] ]])
        vim.cmd([[ let g:UltiSnipsExpandTrigger = '<tab>' ]])
        vim.cmd([[ let g:UltiSnipsJumpForwardTrigger = '<tab>' ]])
        vim.cmd([[ let g:UltiSnipsJumpBackwardTrigger = '<s-tab>' ]])
        vim.cmd([[ let g:UltiSnipsListSnippets = '<c-x><c-s>' ]])
        vim.cmd([[ let g:UltiSnipsRemoveSelectModeMappings = 0 ]])
     end
   }

   use 'cohama/lexima.vim'

   -- use 'godlygeek/tabular'
   -- let g:haskell_tabular = 1
   -- vmap a= :Tabularize /=<CR>
   -- vmap a; :Tabularize /::<CR>
   -- vmap a- :Tabularize /-><CR> use 'dkarter/bullets.vim'

   -- -- use 'kyazdani42/nvim-web-devicons'

   -- prime corner
   use {'ThePrimeagen/vim-be-good', opt=true}
   use {'ThePrimeagen/harpoon'}

    use {'lervag/vimtex', 
      config = function() 
        vim.cmd [[ let g:tex_flavor='latex' ]]
        vim.cmd [[ let g:vimtex_view_method='zathura' ]]
        vim.cmd [[ let g:vimtex_quickfix_mode=1 ]]
      end
-- use 'KeitaNakamura/tex-conceal.vim'
--     let g:tex_conceal='abdmgs'
--     hi Conceal ctermbg=none
   }
end
)


-- vmap a= :Tabularize /=<CR>
-- vmap a; :Tabularize /::<CR>
-- vmap a- :Tabularize /-><CR> use 'dkarter/bullets.vim'

-- use 'prurigro/vim-markdown-concealed'
-- let g:vim_markdown_folding_disabled = 1
-- let g:vim_markdown_math = 1
-- let g:vim_markdown_frontmatter = 1
-- let g:vim_markdown_toml_frontmatter = 1
-- let g:vim_markdown_json_frontmatter = 1
-- let g:vim_markdown_strikethrough = 1
-- let g:vim_markdown_new_list_item_indent = 2

-- use 'rhysd/vim-clang-format'
-- let g:clang_format#code_style = 'google'
-- let g:clang_format#auto_format = 1
-- let g:clang_format#style_options = {
--       \ "BreakBeforeBraces": "Custom",
--       \"BraceWrapping" : {
--         \ "AfterClass" : "true",
--         \ "AfterControlStatement" : "false",
--         \ "AfterEnum" : "true",
--         \ "AfterFunction" : "false",
--         \ "AfterNamespace" : "true",
--         \ "AfterStruct" : "true",
--         \ "AfterUnion" : "true",
--         \ "AfterExternBlock" : "true",
--         \ "BeforeCatch" : "true",
--         \ "BeforeElse" : "true",
--         \ "IndentBraces" : "false",
--         \ "SplitEmptyFunction" : "false",
--         \ "SplitEmptyRecord" : "false",
--         \ "SplitEmptyNamespace" : "false"},
--         \ "IndentCaseBlocks" : "true",
--         \ "AllowShortFunctionsOnASingleLine" : "Empty",
--         \ "AllowShortLoopsOnASingleLine" : "false",
--         \ "AllowShortCaseLabelsOnASingleLine" : "false",
--         \ "AllowShortIfStatementsOnASingleLine" : "Never",
--         \ "AllowShortBlocksOnASingleLine" : "Empty"}
--         \ "RemoveBracesLLVM" : "true",
-- " Haskell
-- use 'neovimhaskell/haskell-vim'
-- " use 'eagletmt/neco-ghc'
-- " use 'eagletmt/ghcmod-vim'
-- " use 'Shougo/vimproc.vim', {'do' : 'make'}
-- use 'prurigro/vim-markdown-concealed'
-- let g:vim_markdown_folding_disabled = 1
-- let g:vim_markdown_math = 1
-- let g:vim_markdown_frontmatter = 1
-- let g:vim_markdown_toml_frontmatter = 1
-- let g:vim_markdown_json_frontmatter = 1
-- let g:vim_markdown_strikethrough = 1
-- let g:vim_markdown_new_list_item_indent = 2
