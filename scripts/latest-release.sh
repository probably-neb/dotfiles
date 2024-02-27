#!/usr/bin/env bash

gh_repo=$1

if [[ $gh_repo == "--help" ]] || [[ $gh_repo == "-h" ]] || [[ -z $gh_repo ]]; then
    echo "Usage: latest-release.sh <owner>/<repo> [<asset-name>]"
    exit 0
fi

# TODO: accept full url as well
owner=$(cut -d'/' -f1 <<< "$gh_repo")
repo=$(cut -d'/' -f2 <<< "$gh_repo")

# Get the latest release information from the GitHub API
release_info=$(curl -s "https://api.github.com/repos/$owner/$repo/releases/latest")

asset_names=$(echo "$release_info" | jq -r '.assets[].name')

asset=$(gum choose ${asset_names})

assets_list=($asset_names)

index=-1

for i in "${!assets_list[@]}"; do
    if [[ "${assets_list[i]}" == "$asset" ]]; then
        index=$i
        break
    fi
done


if [[ $index == -1 ]]; then
    echo "Asset not found"
    exit 1
fi

download_url=$(echo "$release_info" | jq -r ".assets[${index}].browser_download_url")

if [[ -z $download_url ]]; then
    echo "Asset download url not found"
    echo $release_info | jq '.'
    exit 1
fi

echo "Downloading $asset from $download_url"

if [[ -z $2 ]]; then
    output="-J -O"
else
    output="-o $2"
fi

# TODO: use decompress function for auto decompress
function decompress {
    if [[ $asset == *.tar.gz ]]; then
        echo "unzipping tar.gz" >&2
        tar -xz
    elif [[ $asset == *.zip ]]; then
        echo "unzipping zip" >&2
        unzip <(cat)
    else
        echo "Unknown compression format" >&2
        cat > $asset
    fi
}

# Download the release asset
curl -L -o $asset "$download_url"
