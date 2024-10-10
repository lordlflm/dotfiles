#!/bin/bash

GHIDRA_VERSION="11.2" 

read -p "Do you want to install Ghidra_${GHIDRA_VERSION}? [y/n] " r
r=${r:-n}

if [[ "$r" == "y" ]]; then
  if [ -d "$HOME/src/ghidra_${GHIDRA_VERSION}" ]; then
    echo "Ghidra_${GHIDRA_VERSION} is already on the system. Skipping..."
  else
    zip_file="$HOME/src/ghidra_${GHIDRA_VERSION}.zip"

    echo "Downloading Ghidra..."
    wget "https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_${GHIDRA_VERSION}_build/ghidra_${GHIDRA_VERSION}_PUBLIC_20240926.zip" -O "$zip_file"

    echo "Unziping..."
    unzip "$zip_file" -d "$HOME/src/ghidra_${GHIDRA_VERSION}"
    rm -rf "$zip_file"

    echo "Done."
  fi
else
  echo "Skipping..."
fi
