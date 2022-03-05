### fish config for neb ###

set -U fish_greeting
set TERM "xterm-256color"
# set -g theme_color_scheme terminal-dark
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $HOME/.cargo/bin/ $fish_user_paths
set -aU fish_function_path $HOME/.config/fish/functions/tide/ $HOME/.config/fish/functions/z/ $HOME/.config/fish/functions/fzf/ 

#fix gpg
set -x GPG_TTY (tty)

#universal variables for fast vim editing of frequent config files
set -Ux INITVIM '/home/neb/.config/nvim/init.vim'
set -Ux CONFIGFISH '/home/neb/.config/fish/config.fish'
set -Ux KITTYCONF '/home/neb/.config/kitty/kitty.conf'
set -Ux bear 'ʕ·ᴥ·ʔ'

#preferences
set -Ux BROWSER brave
set -Ux EDITOR nvim
abbr --add --global q2 'cd ~/Dropbox/poly/q1_2022/'
abbr --add --global wp 'cd ~/Pictures/wallpapers/'
abbr --add --global nebsite 'cd ~/Dropbox/nebsite/'
abbr --add --global cleanswap 'rm /home/neb/.local/share/nvim/swap/'

#save a character when using nvim because why not
alias vim='nvim'
alias img='kitty +kitten icat'
alias py='python3'

# function fish_user_key_bindings
# 	fzf_key_bindings
# end

function pdf-jpg 
	convert -density 200 $argv'.pdf' -quality 150 $argv'.jpg'
end

function 2test
	coverage run $argv
	mypy --disallow-untyped-defs $argv
	coverage report -m
end

# function cleanswap
# 	set -l path /home/neb/.local/share/nvim/swap/*
# 	rm $path
# end

function spaces_to_underlines 
	for arg in $argv
		set -l argcopy (echo $arg)
		set -l newname (string replace -a " " "_" $arg)
		set -l newfile (string join '/' $pwd $newname)
		mv $argcopy $newfile 
	end
end

function mvmk -d "mv files and create non existing directories"
	set -l dest $argv[-1]
	mkdir $dest
	echo (string join ' ' 'Created Directory' $dest)
	for i in $argv[1..-1]
		mv $i $argv
	end
end
		
alias lolwave='sparkwave | lolcat -F '0.198' -p 3'


# Changing "ls" to "exa"
alias ls='exa -a --color=always --group-directories-first --no-user' # my preferred listing
alias ld='exa -aD --color=always --group-directories-first --no-user'  # only directories
alias ll='exa -al --color=always --group-directories-first --no-user'  # long format
alias lt='exa -aTL 3 --color=always --group-directories-first --no-user' # tree listing
alias l.='exa -a | egrep "^\."'


# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# The bindings for !! and !$
if [ $fish_key_bindings = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end

#function bwu --description 'Sets bitwarden session var after successful login'
  #  bash -c '
 #   BW_SESSION="$(bw unlock --raw)"'
#end



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /home/neb/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

