eval "$(/opt/homebrew/bin/brew shellenv)"

# prompt
eval "$(starship init zsh)"

export PATH="$(brew --prefix)/opt/llvm/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR_CMD='hx'
export EDITOR='hx'

alias editzsh="$EDITOR_CMD ~/.zshrc"
alias workshop="cd $HOME/workshop"
