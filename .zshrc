export FZF_DEFAULT_COMMAND='ag --hidden --ignore "node_modules" -g ""'

export PATH="$HOME/.rbenv/path:$PATH"
eval "$(rbenv init -)"

setopt promptsubst

autoload colors && colors
	
current_git_branch() {
  git rev-parse --abbrev-ref HEAD 2> /dev/null
}

PROMPT="%d %{$fg[green]%}\$(current_git_branch) %{$reset_color%}"$'\n'"> "

# nvm #
#######
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

# git #
#######

alias status="git status"
alias gcm="git commit -m"
alias push="git push origin"
alias fpush="git push -f origin"
alias pull="git pull origin"
alias rebase="git pull --rebase origin"
alias gco='git checkout $(gbsearch)'
alias copybranch="git rev-parse --abbrev-ref HEAD | pbcopy"
alias newbranch='git checkout -b'

function and_add() {
  echo -n $fg[cyan] 'Would you like to add changes? (y/N): '$reset_color
  read confirm
  if [ "$confirm" = "y" ]; then
    git add $1
    git status
  fi
}

function diff() {
  if [ $1 ]; then
    git diff $1;
    and_add $1
  else
    filechoice=$(git ls-files -m | fzf)
    git diff $filechoice
    and_add $filechoice
  fi
}

function add() {
  if [ $1 ]; then
    git add $1 ;
  else
    git ls-files -m | fzf | xargs git add ;
  fi
  git status
}

function gbsearch() {
  git branch --list | fzf
}

function grsearch() {
  git branch --remote --list "*$1*"
}


# Elixir #
##########

function e() {
  elixir $1
}

alias extest="iex -S mix test"

# general #
###########
alias edit='vim `find . | fzf`'
alias editzsh="nvim ~/.zshrc"
alias loadzsh="source ~/.zshrc"
alias l="loadzsh"
alias editvconf='nvim ~/.config/nvim/init.vim'

function cd() {
  builtin cd $1
  ls ./ 
}

function new() {
  touch $1
  code $1
}

function exreset() {
  mix ecto.drop
  mix ecto.create
  mix ecto.migrate
  mix run priv/repo/seeds.exs
}

alias p='vim $(fzf)'
function f() {
  ag $1 ./ | fzf
}

function h() {
  cd ~/$1
}

# rails #
#########

alias be="bundle exec"
alias spec="bundle exec rspec"
alias t="bundle exec rspec"
alias routes="rails routes --expanded -c"
alias rlint="bundle exec rubocop"
alias rs="bin/rails s"
alias testconsole="RAILS_ENV=test bin/rails c"
alias devconsole="RAILS_ENV=development bin/rails c"
alias fixedconsole="RAILS_ENV=fixed_development bin/rails c"
alias start='bin/rails s'
alias migrate='bin/rails db:migrate'

# Rust #
########
alias rr="cargo run"

eval "$(rbenv init -)"

echo "ZSHRC Reloaded"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
