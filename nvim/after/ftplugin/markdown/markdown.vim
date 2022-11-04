set spell spelllang=en_us
set conceallevel=1

function! SwapCheckBox()
   let line = line('.')
   let pos = getcurpos('.')
   let cur = ' '
   let new = 'x'
   if match(getline(line), '\[x]') >= 0
      let cur = 'x'
      let new = ' '
   endif
   let cmd = [':',line,'s/\[', cur, ']/[', new, ']']
   execute join(cmd, '')
   call setpos('.', pos)
endfunction

nnoremap <C-m> :call SwapCheckBox()<CR>
