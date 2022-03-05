function assemble --description 'assemble all assembly programs in current directory'
for i in *.asm
      echo $i && lc3as $i 
  end
end
