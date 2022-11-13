# touches a file and makes it executable
function touchs
   touch $argv
   chmod +x $argv
end
