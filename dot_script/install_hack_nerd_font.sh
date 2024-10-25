#!/bin/sh

tmp_dir=$(mktemp -d)

echo "Downloading Hack Nerd Font..."
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip -O "${tmp_dir}/Hack.zip"
unzip "${tmp_dir}/Hack.zip" -d "${tmp_dir}"
mkdir $HOME/.local/share/fonts/
cp "${tmp_dir}/HackNerdFont-Regular.ttf" $HOME/.local/share/fonts/HackNerdFont-Regular.ttf
rm -rf "$tmp_dir"
echo "Done."
