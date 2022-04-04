function spaces_to_underlines
	for arg in $argv
		set -l argcopy (echo $arg)
		set -l newname (string replace -a " " "_" $arg)
		set -l newfile (string join '/' $pwd $newname)
		mv $argcopy $newfile 
	end
end
