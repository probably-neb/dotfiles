function in_font --description 'installs a font file'
  mv $argv ~/.local/share/fonts/
  fc-cache -f -v
end
