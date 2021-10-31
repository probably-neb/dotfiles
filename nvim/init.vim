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
	set background=dark
	syntax enable
	set pumblend=5
	set wildoptions=pum	
	set winblend=0
endif
"}}}
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:sonokai_better_performance = 1
colorscheme sonokai
"  preferences "{{{
" ---------------------------------------------------------------------
" indents
filetype plugin indent on
set smartindent
set smarttab
set breakindent
set tabstop=4
set shiftwidth=4
set ai
set si

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
"}}}

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

" imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
"}}}

" vim: set foldmethod=marker foldlevel=0:
