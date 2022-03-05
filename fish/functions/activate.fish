function activate
	set env_path (string replace -r '\/$' '' $argv[1])
	set env (string join '/' $env_path 'bin/activate.fish')
	echo Sourcing: $env
	source $env
end
