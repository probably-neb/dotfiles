call plug#begin('/home/neb/.config/nvim/plugged')
Plug 'sainnhe/sonokai'

"Plug 'godlygeek/tabular'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-commentary'
Plug 'dag/vim-fish', {'for' : 'fish'}
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_light='hard'
Plug 'dhruvasagar/vim-table-mode'
let g:table_mode_corner='|'

Plug 'goolord/alpha-nvim'

" latex
Plug 'SirVer/ultisnips' 
" {'for': ['tex', 'mkdc']}
	let g:UltiSnipsEnableSnipMate = 0
	let g:UltiSnipsSnippetDirectories=['/home/neb/dotfiles/nvim/UltiSnips/']
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
	" let g.UltiSnipsListSnippets = '<c-x><c-s>'
	" let g.UltiSnipsRemoveSelectModeMappings = 0

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

	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'

	Plug 'glepnir/lspsaga.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'nvim-lua/popup.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'williamboman/nvim-lsp-installer'
	Plug 'prurigro/vim-markdown-concealed'
endif

call plug#end()
