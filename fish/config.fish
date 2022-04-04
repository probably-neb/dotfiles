### fish config for neb ###

set -U fish_greeting
set TERM "xterm-256color"
# set -e fish_user_paths
# set -U fish_user_paths $HOME/.local/bin $HOME/Applications $HOME/.cargo/bin/ $fish_user_paths
set -aU fish_function_path $HOME/.config/fish/functions/tide/ $HOME/.config/fish/functions/z/ $HOME/.config/fish/functions/fzf/ 

function nebtheme -a theme -d "change kitty and nvim color schemes"
	set -l theme_path "/home/neb/dotfiles/kitty/themes/"$theme".conf"
	set -l image_path "/home/neb/dotfiles/kitty/"$theme".png"
  kitty @ --to=$KITTY_LISTEN_ON set-colors --all --configured $theme_path
	# why set-background-image no work?
	#kitty @ --to=$KITTY_LISTEN_ON set-background-image none
	#set theme in global theme file
	echo $theme > /home/neb/dotfiles/.theme
end

# set theme from global theme file
eval nebtheme (tr '[:upper:]' '[:lower:]' < /home/neb/dotfiles/.theme)

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
abbr --add wp 'cd ~/Pictures/wallpapers/'
abbr --add nebsite 'cd ~/Dropbox/nebsite/'
abbr --add cleanswap 'rm /home/neb/.local/share/nvim/swap/'
abbr --add mvdn 'mv ~/Downloads/'
abbr --add mvdo 'mv ~/Documents/'

#save a character when typing nvim because why not
alias vim='nvim'
#load images in terminal
alias img='kitty +kitten icat'
#bc lazy
alias py='python3'


# function spaces_to_underlines 
# 	for arg in $argv
# 		set -l argcopy (echo $arg)
# 		set -l newname (string replace -a " " "_" $arg)
# 		set -l newfile (string join '/' $pwd $newname)
# 		mv $argcopy $newfile 
# 	end
# end

function mvmk -d "mv files and create non existing directories"
	set -l dest $argv[-1]
	mkdir $dest
	echo 'Created Directory '$dest
	for i in $argv[1..-1]
		mv $i $argv
	end
end
		
alias lolwave="sparkwave | lolcat -F '0.198' -p 3"


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
# function backup --argument filename
#     cp $filename $filename.bak
# end

#function bwu --description 'Sets bitwarden session var after successful login'
  #  bash -c '
 #   BW_SESSION="$(bw unlock --raw)"'
#end

# function pdf-to-jpg 
# 	convert -density 200 $argv'.pdf' -quality 150 $argv'.jpg'
# end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /home/neb/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
