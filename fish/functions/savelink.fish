function savelink
		if test (count $argv) -lt 2
				set name (string match -r "(?<=\/)[A-Za-z\d]*(?=\.)")
				echo $name
		else
				set name $argv[-1]
				echo $name
		end
		touch $name
		set link (string join '' "[Desktop Entry]\n" "Icon=text-html\n" "Type=Link\n" "URL[\$e]=" $argv[1])
		echo -e $link > $name
end
