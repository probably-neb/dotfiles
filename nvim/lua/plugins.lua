vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(
  function(use)
    use 'wbthomason/packer.nvim'

    use_rocks 'htmlparser'

    use '/home/neb/code/nvim-rustdocs'

    use {'morhetz/gruvbox', config = function() vim.g.gruvbox_contrast_light='hard' end, opt=true}

    use {'dag/vim-fish', ft={'fish'}}

    -- -- " tpope corner
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-abolish'

    -- use 'dhruvasagar/vim-table-mode'
-- -- let g:table_mode_corner='|'

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
-- -- let g:haskell_tabular = 1

-- -- vmap a= :Tabularize /=<CR>
-- -- vmap a; :Tabularize /::<CR>
-- -- vmap a- :Tabularize /-><CR> use 'dkarter/bullets.vim'

    -- -- use 'prurigro/vim-markdown-concealed'
-- -- let g:vim_markdown_folding_disabled = 1
-- -- let g:vim_markdown_math = 1
-- -- let g:vim_markdown_frontmatter = 1
-- -- let g:vim_markdown_toml_frontmatter = 1
-- -- let g:vim_markdown_json_frontmatter = 1
-- -- let g:vim_markdown_strikethrough = 1
-- -- let g:vim_markdown_new_list_item_indent = 2
--
    use 'hoob3rt/lualine.nvim'

    use {'neovim/nvim-lspconfig',
       {'williamboman/nvim-lsp-installer'},
       {'nvim-lua/lsp-status.nvim'},
    }
    -- -- cmp stuff
    use {'hrsh7th/cmp-nvim-lsp',
       {'hrsh7th/cmp-buffer'},
       {'hrsh7th/cmp-path'},
       {'hrsh7th/cmp-cmdline'},
       {'hrsh7th/nvim-cmp'},
       {'quangnguyen30192/cmp-nvim-ultisnips'},
       {'uga-rosa/cmp-dictionary'},
       {'rmagatti/goto-preview'},
    }

    -- -- use {'simrat39/rust-tools.nvim', ft = {'rs'}}
    use {'simrat39/rust-tools.nvim'}

    -- use 'zbirenbaum/copilot.lua'
    -- -- find way to load after
    -- use 'zbirenbaum/copilot-cmp'

    use 'nvim-lua/plenary.nvim'

    use 'glepnir/lspsaga.nvim'

    use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}

    use 'nvim-telescope/telescope.nvim'

    use 'BurntSushi/ripgrep'

    use 'nvim-lua/popup.nvim'

    use 'windwp/nvim-autopairs'

    use 'wellle/targets.vim' -- god this plugin is fucking amazing

    -- -- use 'kyazdani42/nvim-web-devicons'
    use {'ThePrimeagen/vim-be-good', opt=true}
  end
)

    -- use 'lervag/vimtex' 
  -- let g:tex_flavor='latex'
  -- let g:vimtex_view_method='zathura'
  -- let g:vimtex_quickfix_mode=0
-- " use 'KeitaNakamura/tex-conceal.vim'
-- "     let g:tex_conceal='abdmgs'
-- "     hi Conceal ctermbg=none

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
