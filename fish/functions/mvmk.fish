function mvmk --description 'mv files and create non existing directories'
    set -l dest $argv[-1]
    mkdir -p $dest
    echo 'Created Directory '$dest
    mv $argv[..]
end
