# Dotfiles
## Install 
```bash
# 1. setup Guest additions
# 2. ssh-keygen
# 3. Install git and curl
export GITHUB_USERNAME=lordlflm
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:$GITHUB_USERNAME/dotfiles.git
```

## features
- walselect
- nvims
- TODO gdbs

## TODO
- install docker
- setup sway
- kitty layouts like in terminator (split from active window)

- setup zsh (p10k, ohmyzsh, completion, etc)
- install gdb variant
- gdb switcher

- setup onedrive alternative
- setup password manager
## Dont know howTODO
- kitty margins opacity 0
- kitty terminal borders follows theme set by pywal
- kitty terminal blur not working on gnome?
- kitty tab bar follows theme set by pywal

- nvim and lualine coloscheme follows theme set by pywal
- nvim opacity and blur is same as kitty

- ranger pops up in a small window in the middle instead of taking the whole terminal
