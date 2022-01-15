call plug#begin('/home/neb/.config/nvim/plugged')

"Plug 'godlygeek/tabular'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-commentary'
Plug 'dag/vim-fish', {'for' : 'fish'}

" latex
Plug 'SirVer/ultisnips', {'for': 'tex'}
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
	let g:UltiSnipsEnableSnipMate = 0
	let g:UltiSnipsSnippetDirectories=['/home/neb/dotfiles/nvim/UltiSnips/']
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
  " Plug 'kristijanhusak/defx-git'
  " Plug 'kristijanhusak/defx-icons'
  " Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'commit': '8ada8faf2fd5a74cc73090ec856fa88f34cd364b', 'do': ':TSUpdate'}
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lua/popup.nvim'
  " Plug 'nvim-lua/plenary.nvim'
  " Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'williamboman/nvim-lsp-installer'
  " main one
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  " 9000+ Snippets
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
  " lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
  " Need to **configure separately**
  Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
  " - shell repl nvim lua api, scientific calculator, comment banner, etc
	
	Plug 'prurigro/vim-markdown-concealed'

endif


call plug#end()
