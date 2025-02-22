set -U fish_greeting (fortune)
# set fish_greeting (checkupdates || true && yay -Qua)

#keybindings
set -g fish_key_bindings fish_vi_key_bindings

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
set -gx BROWSER firefox
set -gx EDITOR nvim

abbr --add wp 'cd ~/Pictures/wallpapers/'
abbr --add nebsite 'cd ~/Dropbox/nebsite/'
abbr --add cleanswap 'rm /home/neb/.local/share/nvim/swap/'
abbr --add mvdn 'mv ~/Downloads/'
abbr --add mvdo 'mv ~/Documents/'
abbr --add v 'nvim'
abbr --add cerrcodes 'sqlite3 ~/Documents/csc/errcodes.sqlite'
abbr --add scpvim 'nvim scp://$unix1/'
abbr --add scripts '~/dotfiles/scripts/'

alias lg='lazygit'
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
alias cat='bat'

alias tmux-killunatached='tmux list-sessions | grep -v attached | awk \'BEGIN{FS=":"}{print $1}\' | xargs -n 1 tmux kill-session -t || echo No sessions to kill'


zoxide init fish | source
mise activate fish | source

# function spaces_to_underlines 
# 	for arg in $argv
# 		set -l argcopy (echo $arg)
# 		set -l newname (string replace -a " " "_" $arg)
# 		set -l newfile (string join '/' $pwd $newname)
# 		mv $argcopy $newfile 
# 	end
# end

alias lolwave="sparkwave | lolcat -F '0.198' -p 3"


# Changing "ls" to "exa"
if type -q "exa"
    #color only if output is tty
    function ls
        if test -t 1
            exa -a --color=always --group-directories-first --no-user $argv
        else
            exa --color=never $argv
        end
    end
        
    # alias ls='if test -t 1; exa -a --color=always --group-directories-first --no-user; else; exa --color=never; end;' 
    alias lsn='exa -a --color=never --group-directories-first --no-user' # my preferred listing with no color
    alias ld='exa -aD --color=always --group-directories-first --no-user'  # only directories
    alias ll='exa -al --color=always --group-directories-first --no-user'  # long format
    alias lt='exa -aTL 3 --color=always --group-directories-first --no-user' # tree listing
    alias l.='exa -a | egrep "^\."'
end

# wrap rm to move to trash
function trash
  mkdir -p /tmp/trash/
  mv $argv /tmp/trash/
end

# make executable file
function mkx
    touch $argv
    chmod +x $argv
    echo $argv
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

fish_ssh_agent
# sst
fish_add_path /home/neb/.sst/bin
