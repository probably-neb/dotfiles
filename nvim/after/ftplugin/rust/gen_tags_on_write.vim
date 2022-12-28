" colorscheme iroh
" autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!/home/neb/.cargo/bin/rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
