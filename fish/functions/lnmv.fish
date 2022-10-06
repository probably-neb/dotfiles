function lnmv --description 'move [file...] to [dest] and create a soft link'
    set -f len_argv (count $argv)
    if test $len_argv -ft 2
      echo "lnmv [file...] [dest]"
    end
    set -f dest $argv[-1]
    # dont link more than one file to dest if dest is file 
    if test -f dest and test $len_argv -gt 2
      echo "dest is file, only one file arg allowed. Set dest to dir and try again"
    end
    set -f files $argv[1..-2]

    for f in $files
        set -f b (basename $f)
        #if dest is dir
        if test -d $dest
          set -f f_dest $dest/$b
        else
          set -f f_dest $dest
        end
        mv $f $f_dest
        ln -s $f_dest $f
        echo "$f -> $f_dest"
    end
end
