function decap
xclip -sel clip -out | sed '/^$/d' | paste -sd ' ' | tr \[:upper:] \[:lower:] | xclip -sel clip -in
xclip -sel clip -out
end
