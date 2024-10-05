#!/bin/sh

tmp_dir=$(mktemp -d)

if [ -d "$HOME/Pictures/wallpapers" ];then
  echo "Cloning cool wallpapers into ~/Pictures/wallpapers"
  git clone https://github.com/JaKooLit/Wallpaper-Bank.git "${tmp_dir}"
  mv "${tmp_dir}/wallpapers" $HOME/Pictures/
  rm -rf $tmp_dir
  echo "Done."
fi 
