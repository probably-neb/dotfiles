" vim: foldmethod=marker 
" vim: foldlevel=0
" nebvim

let mapleader = ' '
syntax enable

lua require('plugins')
" source ./plug.vim

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
" autocmd Bufread * execute helptags ALL
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
map <Leader>te :VimtexErrors<CR>
map <Leader>c gcc
xmap <Leader>c gc
" move left and right buffers with  h l
nmap <Leader>l :bn<CR>
nmap <Leader>h :bp<CR>
xnoremap <Leader>j :g/^\s*$/d - <CR>:noh<CR>:call clearmatches()<CR>
"}}}

" commands "{{{
command InitVim e ~/dotfiles/nvim/init.vim
command TexHeader e ~/Dropbox/poly/preamble.tex
" command Gruvbox :source /home/neb/dotfiles/nvim/.gruvbox
" command Sonokai :source /home/neb/dotfiles/nvim/.sonokai
"}}}

" fix py "{{{
" ---------------------------------------------------------------------
" if has('nvim') && !empty($CONDA_PREFIX)
" 	let g:python3_host_prog = '/home/neb/anaconda3/envs/cp-knowledge-graph/bin/python'
" else
" 	let g:python3_host_prog = '/usr/bin/python'
" endif
" let g:python3_host_prog = './nvimenv/bin/python3'
"}}}
