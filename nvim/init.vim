" vim: foldmethod=marker 
" vim: foldlevel=0
" nebvim

let mapleader = ' '
syntax enable

" Plug {{{
"
" ---------------------------------------------------------------------
" use directory for shared ft specific binds and then use runtime /blah.vim in
" each ft plugin to share binds
"
call plug#begin('/home/neb/.config/nvim/plugged')

Plug 'ThePrimeagen/vim-be-good'
" colors
" Plug 'bradcush/base16-nvim'
Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
Plug 'unikmask/iroh-vim'
Plug 'fcpg/vim-fahrenheit'
Plug 'adigitoleo/vim-mellow'
let g:gruvbox_contrast_light='hard'

Plug 'dag/vim-fish', {'for' : 'fish'}

" tpope corner
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'

Plug 'dhruvasagar/vim-table-mode'
let g:table_mode_corner='|'

Plug 'SirVer/ultisnips' 
  let g:UltiSnipsEnableSnipMate = 0
  let g:UltiSnipsSnippetDirectories=['/home/neb/dotfiles/nvim/UltiSnips/']
  let g:UltiSnipsExpandTrigger = '<tab>'
  let g:UltiSnipsJumpForwardTrigger = '<tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
  " let g.UltiSnipsListSnippets = '<c-x><c-s>'
  " let g.UltiSnipsRemoveSelectModeMappings = 0
  
Plug 'lervag/vimtex' 
  let g:tex_flavor='latex'
  let g:vimtex_view_method='zathura'
  let g:vimtex_quickfix_mode=0
" Plug 'KeitaNakamura/tex-conceal.vim'
"     let g:tex_conceal='abdmgs'
"     hi Conceal ctermbg=none

Plug 'cohama/lexima.vim'
Plug 'godlygeek/tabular'
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR> Plug 'dkarter/bullets.vim'

Plug 'prurigro/vim-markdown-concealed'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2

if has("nvim")
  Plug 'hoob3rt/lualine.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'nvim-lua/lsp-status.nvim'

  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'
  Plug 'uga-rosa/cmp-dictionary'
  Plug 'simrat39/rust-tools.nvim'
  Plug 'zbirenbaum/copilot.lua'
  " find way to load after
  Plug 'zbirenbaum/copilot-cmp'

	Plug 'glepnir/lspsaga.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  Plug 'nvim-lua/plenary.nvim'
  Plug 'BurntSushi/ripgrep'
  Plug 'nvim-telescope/telescope.nvim'

  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lua/popup.nvim'
  Plug 'windwp/nvim-autopairs'

  " Plug 'nvim-orgmode/orgmode'
  " syntax match OrgHeadlineStar1 /^\*\ze\s/me=e-1 conceal cchar=◉ containedin=OrgHeadlineLevel1 contained
  " syntax match OrgHeadlineStar2 /^\*\{2}\ze\s/me=e-1 conceal cchar=○ containedin=OrgHeadlineLevel2 contained
  " syntax match OrgHeadlineStar3 /^\*\{3}\ze\s/me=e-1 conceal cchar=✸ containedin=OrgHeadlineLevel3 contained
  " syntax match OrgHeadlineStar4 /^\*{4}\ze\s/me=e-1 conceal cchar=✿ containedin=OrgHeadlineLevel4 contained

endif

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

Plug 'rmagatti/goto-preview'

Plug 'rhysd/vim-clang-format'
let g:clang_format#code_style = 'google'
let g:clang_format#auto_format = 1
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
        \ "SplitEmptyNamespace" : "false"},
        \ "IndentCaseBlocks" : "true",
        \ "AllowShortFunctionsOnASingleLine" : "Empty",
        \ "AllowShortLoopsOnASingleLine" : "false",
        \ "AllowShortCaseLabelsOnASingleLine" : "false",
        \ "AllowShortIfStatementsOnASingleLine" : "Never",
        \ "AllowShortBlocksOnASingleLine" : "Empty"}
        \ "RemoveBracesLLVM" : "true",

" Haskell
Plug 'neovimhaskell/haskell-vim'
" Plug 'eagletmt/neco-ghc'
" Plug 'eagletmt/ghcmod-vim'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>


autocmd FileType c,cpp,objc, nnoremap <buffer><Leader>= :<C-u>ClangFormat<CR>

call plug#end()
"}}}

" shell "{{{
" ---------------------------------------------------------------------
if &shell =~# 'fish$'
	set shell=sh
endif
"}}}

" colors "{{{
" ---------------------------------------------------------------------
if (has("termguicolors"))
	set termguicolors
	set t_Co=256
	syntax on
	let &t_ut=''
	syntax enable
	set pumblend=5
	set wildoptions=pum	
	set winblend=0
endif
" set color scheme
" let s:theme_name = readfile('/home/neb/dotfiles/.theme')[0]
" let s:theme_path = printf("source /home/neb/dotfiles/nvim/.%s", s:theme_name)
" let s:iroh_filetypes = ['rust']
" iroh highlight func "{{{


function! s:Highlight(group, fg, ...)
	" Assign foreground
	let fg = a:fg

	" If more than 1 extra arg, set extra as background.
	if a:0 >=1
		let bg = a:1
	else
		let bg = s:none
	endif

	" Add emphasis to the highlight for extra possibilities like inverse
	if a:0 >= 2 && strlen(a:2)
		let emstr = a:2
	else
		let emstr = 'NONE,'
	endif

	" Do highlight string 
	let hlstr = ['hi', a:group,
			\ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
			\ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
			\ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
			\ ]

	execute join(hlstr, ' ')
endfunction
" }}}
" if index(s:iroh_filetypes, &filetype) != -1
"    colorscheme iroh
   " extracted from iroh to set background
   " let s:bg 	=  ['#2e2b2a', 236]
   " let s:none = ['NONE', 'NONE']
   " call s:Highlight('IrohBg', s:none, s:bg)
" else
colorscheme base16
" endif

let g:rainbow_active = 1
"}}}

"  preferences "{{{
" ---------------------------------------------------------------------
" indents
filetype plugin indent on
syntax enable

set updatetime=100
set smartindent
set smarttab
set breakindent
set tabstop=3
set shiftwidth=3
set expandtab
set ai
set si
" shada file
set shada
" set path+=**
set smartcase
set incsearch
set relativenumber 
set ruler
set clipboard=unnamedplus
" setlocal spell spelllang=en_us
set scrolloff=10

set mouse=a
" incremental substitution (neovim)
if has('nvim')
	set inccommand=split
endif
set completeopt=menu,menuone,noselect
set modeline
set modelines=5
autocmd Bufread,BufNewFile *.h set filetype=c 
"}}}

" keymaps "{{{
" ---------------------------------------------------------------------
" ii for quick escape
" :imap ii <Esc>
inoremap <Up> <Esc>
" spell correction
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap <C-k> <C-x><C-k>
" newlines w/o insert mode
nnoremap <C-Enter> moO<Esc>`o
nnoremap <Enter> moo<Esc>`o
" visual up down with wrapped lines
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nnoremap <C-Bslash> gcc
" xnoremap <C-Bslash> gc
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" leader binds 
nmap <Leader>tc :VimtexCompile<CR>
nmap <Leader>te :VimtexErrors<CR>
nmap <Leader>c gcc
xmap <Leader>c gc
" move left and right buffers with  h l
nmap <Leader>l :bn<CR>
nmap <Leader>h :bp<CR>
xnoremap <Leader>j :g/^\s*$/d - <CR>:noh<CR>:call clearmatches()<CR>
"}}}

" commands "{{{
command InitVim e ~/dotfiles/nvim/init.vim
command TexHeader e ~/Dropbox/poly/preamble.tex
command Gruvbox :source /home/neb/dotfiles/nvim/.gruvbox
command Sonokai :source /home/neb/dotfiles/nvim/.sonokai
"}}}

" fix conda "{{{
" ---------------------------------------------------------------------
if has('nvim') && !empty($CONDA_PREFIX)
	let g:python3_host_prog = '/home/neb/anaconda3/envs/cp-knowledge-graph/bin/python'
else
	let g:python3_host_prog = '/usr/bin/python'
endif
"}}}
