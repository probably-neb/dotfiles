# set -U fish_function_path "~/dotfiles/fish/functions/{,z/} /usr/share/fish/functions/ "
# if not contains /home/neb/dotfiles/fish/functions/z $fish_function_path
#  echo "adding z path"
#  set -a fish_function_path ~/dotfiles/fish/functions/z
# end
### fish config for neb ###
set -U fish_greeting (fortune)
# set fish_greeting (checkupdates || true && yay -Qua)

set TERM "xterm-256color"

#keybindings
set -g fish_key_bindings fish_vi_key_bindings
# set -e fish_user_paths
# set -U fish_user_paths $HOME/.local/bin $HOME/Applications $HOME/.cargo/bin/ $fish_user_paths
# fish_add_path --path '/home/neb/.ghcup/bin/ghcup'
#
# set -aU fish_function_path $HOME/.config/fish/functions/tide/ $HOME/.config/fish/functions/z/ $HOME/.config/fish/functions/fzf/ 
#
#

set -g hydro_color_normal (set_color green)
set -g hydro_color_path (set_color magenta)

#function nebtheme -a theme -d "change kitty and nvim color schemes"
#	set -l theme_path "/home/neb/dotfiles/kitty/themes/"$theme".conf"
#	set -l image_path "/home/neb/dotfiles/kitty/"$theme".png"
#  kitty @ --to=$KITTY_LISTEN_ON set-colors --all --configured $theme_path
#	# why set-background-image no work?
#	kitty @ --to=$KITTY_LISTEN_ON set-background-image none
#	#set theme in global theme file
#	echo $theme > /home/neb/dotfiles/.theme
#end

# set theme from global theme file
# eval nebtheme (tr '[:upper:]' '[:lower:]' < /home/neb/dotfiles/.theme)

#fix gpg
set -x GPG_TTY (tty)

#universal variables 
set -Ux INITVIM '/home/neb/.config/nvim/init.vim'
set -Ux CONFIGFISH '/home/neb/.config/fish/config.fish'
set -Ux KITTYCONF '/home/neb/.config/kitty/kitty.conf'
set -Ux bear 'ʕ·ᴥ·ʔ'
# set -Ux unix1 'bkunkle@unix1.csc.calpoly.edu'
set -gx charge_control_thresholds '/sys/devices/platform/huawei-wmi/charge_control_thresholds'

#preferences
set -Ux BROWSER brave
set -gx EDITOR nvim

abbr --add wp 'cd ~/Pictures/wallpapers/'
abbr --add nebsite 'cd ~/Dropbox/nebsite/'
abbr --add cleanswap 'rm /home/neb/.local/share/nvim/swap/'
abbr --add mvdn 'mv ~/Downloads/'
abbr --add mvdo 'mv ~/Documents/'
abbr --add v 'nvim'
abbr --add cerrcodes 'sqlite3 ~/Documents/csc/errcodes.sqlite'
abbr --add scpvim 'nvim scp://$unix1/'

alias t='kitty @ launch --cwd=current --type=tab'
#save a character when typing nvim because why not
alias vim='nvim'
#load images in terminal
alias img='kitty +kitten icat'
#bc lazy
alias py='python3'
#rg -> ripgrep bc forgetful
alias rigpgrep='rg'

alias clone='clone-in-kitty'

alias hx='helix'


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

# wrap rm to move to trash
function trash
  mkdir -p /tmp/trash/
  mv $argv /tmp/trash/
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

bind '.' __history_previous_command
#function bwu --description 'Sets bitwarden session var after successful login'
  #  bash -c '
 #   BW_SESSION="$(bw unlock --raw)"'
#end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /home/neb/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# if not set -q $printed_bonsai
#   cbonsai -p
#   set -gx printed_bonsai "pleasenoprintagain"
# end
