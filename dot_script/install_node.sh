#!/bin/bash

read -p "Do you want to install Nodejs? [y/n] " r
r=${r:-n}

if [[ "$r" == "y" ]]; then
  echo "Installing pwntools..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
  nvm install node
  echo "Done."
else
  echo "Skipping..."
fi
