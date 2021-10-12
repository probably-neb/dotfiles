" nebvim

if (has("termguicolors"))
	set termguicolors
endif

set t_Co=256
colorscheme monokai_pro
set background=dark
set smartcase
set incsearch
set smartindent
set breakindent
set number relativenumber
set tabstop=4
set shiftwidth=4
set clipboard=unnamedplus
setlocal spell
set spelllang=en_us
syntax enable
filetype plugin indent on
set clipboard=unnamedplus
let g:python_highlight_all = 1

" " keymaps
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

" " plugged
call plug#begin('/home/neb/.config/nvim/plugged')

Plug 'lervag/vimtex'
	let g:tex_flavor='latex'
	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
	set conceallevel=1
	let g:tex_conceal='abdmg'

Plug 'sirver/ultisnips'
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = 's-tab'
	let g:UltiSnipsSnippetDirectories=["snips"]

Plug 'dag/vim-fish'
	autocmd FileType fish compiler fish
	autocmd FileType fish setlocal textwidth=79
	autocmd FileType fish setlocal foldmethod=expr

Plug 'vim-python/python-syntax'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'godlygeek/tabular'
call plug#end()
