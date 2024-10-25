# Dotfiles
## Install 
```bash
sudo apt install curl git bzip2 tar
# Install guest additions `sudo /media/lflm/VBox_GAs_7.1.2/VBoxLinuxAdditions.run`
ssh-keygen
export GITHUB_USERNAME=lordlflm
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply git@github.com:$GITHUB_USERNAME/dotfiles.git
```

## features
- walselect
- nvims
- TODO gdbs

## TODO
- install docker
- setup sway
- kitty layouts like in terminator (split from active window)
- install gdb variants (peda, pwndeb, gef)
- gdb switcher
- discord, vscode

- setup onedrive alternative (nextcloud, mount with webdav, iphone interface, web interface)
- setup password manager
## Dont know howTODO
- kitty margins opacity 0
- kitty terminal borders follows theme set by pywal
- kitty terminal blur not working on gnome?
- kitty tab bar follows theme set by pywal

- nvim and lualine coloscheme follows theme set by pywal
- nvim opacity and blur is same as kitty

- ranger pops up in a small window in the middle instead of taking the whole terminal
