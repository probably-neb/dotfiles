" nebvim

" shell "{{{
" ---------------------------------------------------------------------
if &shell =~# 'fish$'
	set shell=sh
endif
"}}}
"
" colors "{{{
" ---------------------------------------------------------------------
if (has("termguicolors"))
	set termguicolors
	set t_Co=256
	let &t_ut=''
	syntax enable
	set pumblend=5
	set wildoptions=pum	
	set winblend=0
endif
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:sonokai_better_performance = 1
colorscheme sonokai
set background=dark
"}}}
"
"  preferences "{{{
" ---------------------------------------------------------------------
" indents
filetype plugin indent on
set smartindent
set smarttab
set breakindent
set tabstop=2
set shiftwidth=2
set ai
set si
" shada file
set shada
set path+=**
set smartcase
set incsearch
set number relativenumber
set clipboard=unnamedplus
" setlocal spell spelllang=en_us
set scrolloff=10

" incremental substitution (neovim)
if has('nvim')
	set inccommand=split
endif
let g:coq_settings = { 'auto_start': 'shut-up'}
"}}}
"
" keymaps "{{{
" ---------------------------------------------------------------------
:imap ii <Esc>
" spell correction
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap <C-k> <C-x><C-k>
" newlines w/o insert mode
nnoremap <C-Enter> moO<Esc>`o
nnoremap <Enter> moo<Esc>`o
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
"}}}
"
" imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
"}}}
if has('nvim') && !empty($CONDA_PREFIX)
	let g:python3_host_prog = '/home/neb/anaconda3/envs/cp-knowledge-graph/bin/python'
endif"
" vim: set foldmethod=marker foldlevel=0:
