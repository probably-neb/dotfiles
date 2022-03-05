function cleanez
	echo 'made-ez' >> /home/neb/Documents/made-ez
	cat /home/neb/Documents/made-ez | while read -l line
			rm (string join '' '/home/neb/Documents/' $line)
			echo (string join ' ' 'Removing:' $line)
		end
		touch /home/neb/Documents/made-ez
end
