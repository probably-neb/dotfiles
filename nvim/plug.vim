call plug#begin('/home/neb/.config/nvim/plugged')
Plug 'sainnhe/sonokai'

"Plug 'godlygeek/tabular'
Plug 'cohama/lexima.vim'
Plug 'dag/vim-fish'

"tpope appreciation corner
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'

Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_light='hard'

Plug 'dhruvasagar/vim-table-mode'
let g:table_mode_corner='|'

	Plug 'prurigro/vim-markdown-concealed'

  " I \heart ultisnips
Plug 'SirVer/ultisnips' 
	let g:UltiSnipsEnableSnipMate = 0
	let g:UltiSnipsSnippetDirectories=['/home/neb/dotfiles/nvim/UltiSnips/']
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
	" let g.UltiSnipsListSnippets = '<c-x><c-s>'
	" let g.UltiSnipsRemoveSelectModeMappings = 0

" latex
Plug 'lervag/vimtex' 
	syntax enable
	let g:tex_flavor='latex'
	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_mode=0
" Plug 'KeitaNakamura/tex-conceal.vim'
"     let g:tex_conceal='abdmgs'
"     hi Conceal ctermbg=none

if has("nvim")
	Plug 'hoob3rt/lualine.nvim'
	Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'

	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'
  Plug 'uga-rosa/cmp-dictionary'

	Plug 'glepnir/lspsaga.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'BurntSushi/ripgrep'
  Plug 'nvim-telescope/telescope.nvim'

	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'nvim-lua/popup.nvim'
  Plug 'windwp/nvim-autopairs'

  Plug 'nvim-orgmode/orgmode'

endif

" additional text objects
Plug 'bkad/CamelCaseMotion'
let g:camelcasemotion_key = ','
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" map <silent> ge <Plug>CamelCaseMotion_ge
" sunmap w
" sunmap b
" sunmap e
" sunmap ge
Plug 'wellle/targets.vim' " god this plugin is fucking amazing

Plug 'rhysd/vim-clang-format'
let g:clang_format#code_style = 'google'
let g:clang_format#style_options = {
      \ "BreakBeforeBraces": "Custom",
      \"BraceWrapping" : {
        \ "AfterClass" : "true",
        \ "AfterControlStatement" : "false",
        \ "AfterEnum" : "true",
        \ "AfterFunction" : "false",
        \ "AfterNamespace" : "true",
        \ "AfterStruct" : "true",
        \ "AfterUnion" : "true",
        \ "AfterExternBlock" : "true",
        \ "BeforeCatch" : "true",
        \ "BeforeElse" : "true",
        \ "IndentBraces" : "false",
        \ "SplitEmptyFunction" : "false",
        \ "SplitEmptyRecord" : "false",
        \ "SplitEmptyNamespace" : "false"}}
autocmd FileType c,cpp,objc, nnoremap <buffer><Leader>= :<C-u>ClangFormat<CR>

call plug#end()
