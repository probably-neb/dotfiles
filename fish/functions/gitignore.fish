function gitignore
  for file in $argv
    echo $file >> .gitignore
  end
end
