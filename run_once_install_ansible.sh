#!/bin/bash

install_on_ubuntu() {
  sudo apt-get update
  sudo apt-get install -y ansible
  # TODO echo feedback
}

install_on_arch() {
  sudo pacman -Syu
  sudo pacman -S ansible
  # TODO echo feedback
}

OS="$(uname -s)"
case "${OS}" in
  Linux*)
    if [ -f /etc/lsb-release ]; then
      install_on_ubuntu
      echo "Ansible installation complete."
      echo "Installing packages for Ubuntu..."
      # TODO change path to playbook
      ansible-playbook ./bootstrap/ubuntu_setup.yml --ask-become-pass
    elif [ -f /etc/arch-release ]; then
      install_on_arch
      echo "Ansible installation complete."
      echo "Installing packages for Archlinux..."
      # TODO change path to playbook
      ansible-playbook ./bootstrap/archlinux_setup_setup.yml --ask-become-pass
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
