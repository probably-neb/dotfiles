#!/usr/bin/env bash
prefix="~/dotfiles/scripts"

selected=`cat .tmux-cht-languages "$prefix/.tmux-cht-command" | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" "$prefix/.tmux-cht-languages"; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi

