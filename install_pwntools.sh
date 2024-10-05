#!/bin/bash

read -p "Do you want to install Pwntools? [y/n] " r
r=${r:-n}

if [[ "$r" == "y" ]]; then
  echo "Installing pwntools..."
  pipx install pwntools
  pipx ensurepath
  echo "Done."
else
  echo "Skipping..."
fi
