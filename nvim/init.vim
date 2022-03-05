" nebvim

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
	let &t_ut=''
	syntax enable
	set pumblend=5
	set wildoptions=pum	
	set winblend=0
endif
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 0
let g:sonokai_disable_italic_comment = 1
let g:sonokai_better_performance = 1
colorscheme sonokai
set background=dark
"}}}

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
nnoremap <C-/> gcc

" leader binds "{{{
let mapleader = ' '
nmap <Leader>tc :VimtexCompile
nmap <Leader>te :VimtexErrors
"}}}
"}}}

" commands "{{{
command TexHeader e ~/Dropbox/poly/preamble.tex
command Gruvbox set background=light | let g:gruvbox_contrast_light= 'hard' | colorscheme gruvbox
command Sonokai set background=dark | colorscheme sonokai
"}}}

" imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
"}}}

" fix conda "{{{
" ---------------------------------------------------------------------
if has('nvim') && !empty($CONDA_PREFIX)
	let g:python3_host_prog = '/home/neb/anaconda3/envs/cp-knowledge-graph/bin/python'
else
	let g:python3_host_prog = '/usr/bin/python'
endif
"}}}

" use directory for shared ft specific binds and then use runtime /blah.vim in
" each ft plugin to share binds
" vim: set foldmethod=marker foldlevel=0:
