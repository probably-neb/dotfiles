function lnmv --description 'move [file...] to [dest] and create a soft link'
    set -l len_argv (count $argv)
    if test $len_argv -lt 2
      echo "lnmv [file...] [dest]"
      return 1
    end
    # dont link more than one file to dest if dest is file 
    if test $len_argv -gt 2
      echo "only one source file allowed"
      return 1
    end

   set -l dest (realpath $argv[2])
   if test ! $status
      echo "fail dest"
      return 1
    end
    set -l source $argv[1]
    if test ! $status
       echo "fail source"
       return 1
    end
    set -l b (basename $source)
    #if dest is dir
    if test -d $dest
       set dest (path normalize "$dest/$b")
    end
    mv $source $dest
    ln -s $dest $source
    echo "$source -> $dest"
end
