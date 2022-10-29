function gitpushnew
git remote add origin $argv[1]
git branch -M main
git push -u origin main
end
