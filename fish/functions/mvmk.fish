function mvmk --description 'mv files and create non existing directories'
	set -l dest $argv[-1]
	mkdir $dest
	echo (string join ' ' 'Created Directory' $dest)
	for i in $argv[1..-1]
		mv $i $argv
	end
end
