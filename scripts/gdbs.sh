#!/bin/sh

items=("default" "peda" "gef" "pwndbg")
config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" GDB congif " --height=50% --layout=reverse --border --exit-0)

if [[ -z $config ]]; then
  echo "nothing selected"
  return 0
elif [[ $config == "default" ]]; then
  echo "" > $HOME/.gdbinit
elif [[ $config == "peda" ]]; then
  echo "source $HOME/src/peda/peda.py" > $HOME/.gdbinit
elif [[ $config == "gef" ]]; then
  echo "source $HOME/.gef-2024.06.py"
elif [[ $config == "pwndbg" ]]; then
  echo "source $HOME/src/pwndbg/gdbinit.py" > $HOME/.gdbinit
fi

gdb
