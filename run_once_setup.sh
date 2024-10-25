#!/bin/bash

install_on_debian() {
  sudo apt-get update
  sudo apt-get install -y ansible
  # TODO echo feedback
}

# install_on_arch() {
#   sudo pacman -Syu
#   sudo pacman -S ansible
#   # TODO echo feedback
# }

chmod +x ./.script/init.sh
./.script/init.sh

OS="$(uname -s)"
case "${OS}" in
  Linux*)
    if [ -f /etc/debian_version ]; then
      install_on_debian
      echo "Ansible installation complete."
      echo "Installing packages for Debian based distro..."
      ansible-playbook ~/.bootstrap/debian_setup.yml --ask-become-pass
    else 
      echo "Unsupported Linux distro. Exiting..."
      exit 1
    fi
    ;;
  *)
    echo "Unsupported operating system: ${OS}. Exiting..."
    exit 1
    ;;
esac

# Install scripts

chmod +x ./.script/install_hack_nerd_font.sh
./.script/install_hack_nerd_font.sh

chmod +x ./.script/setup_zsh.sh
./.script/setup_zsh.sh

chmod +x ./.script/install_pywal16.sh
./.script/install_pywal16.sh

chmod +x ./.script/clone_wallpapers.sh
./.script/clone_wallpapers.sh

chmod +x ./.script/install_ghidra.sh
./.script/install_ghidra.sh

chmod +x ./.script/install_nvim.sh
./.script/install_nvim.sh

chmod +x ./.script/install_node.sh
./.script/install_node.sh

chmod +x ./.script/install_rust.sh
./.script/install_rust.sh

chmod +x ./.script/install_golang.sh
./.script/install_golang.sh

source .profile
source .bashrc
source .zshrc

See /var/log/dotfiles_bootstrap.log for potential errors
