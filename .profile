export EDITOR="nvim"

# nvim binary
export PATH="$HOME/neovim/bin:$PATH"

# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# golang
export PATH=$PATH:/usr/local/go/bin

# node global packages
export PATH=$PATH:$(npm get prefix)/bin

# rust
. "$HOME/.cargo/env"
