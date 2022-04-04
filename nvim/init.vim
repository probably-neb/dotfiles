" nebvim

let mapleader = ' '

" imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
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
let s:theme_name = readfile('/home/neb/dotfiles/.theme')[0]
let s:theme_path = printf("source /home/neb/dotfiles/nvim/.%s", s:theme_name)
execute s:theme_path
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
set number 
set clipboard=unnamedplus
" setlocal spell spelllang=en_us
set scrolloff=10

" incremental substitution (neovim)
if has('nvim')
	set inccommand=split
endif
set completeopt=menu,menuone,noselect
" let g:coq_settings = { 'auto_start': 'shut-up'}
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

" use directory for shared ft specific binds and then use runtime /blah.vim in
" each ft plugin to share binds
" vim: set foldmethod=marker foldlevel=0:
