function mkez
	for i in $argv
		ln $i /home/neb/Documents/
		echo $i >> /home/neb/Documents/made-ez
		echo $i made easy!
	end
end
