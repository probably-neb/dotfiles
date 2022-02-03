function prepend --description 'prepend to files'
	set text ""
	for i in $argv[1..-1]
		set text (string join ' ' $text $i)
	end
	echo -e $text | cat - $argv[-1] > tmp.tmp
	mv tmp.tmp $argv[-1]
end
