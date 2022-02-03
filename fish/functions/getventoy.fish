function getventoy
curl -s https://api.github.com/repos/ventoy/Ventoy/releases/latest \
      | grep "browser_download_url.*linux" \
      | grep -Eo 'https://[^\"]*' \
      | xargs wget -O - \
      | tar -xz
end
