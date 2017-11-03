function nvm () {
  unset -f nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  nvm "$@"
}

function nrc () {
  echo "Activating .npmrc: $1"
  npmrc $1
  sourceme
}

## npm
alias nga="mv .npmrc .npmrcbu" # npmrc... go away!
alias ncb="mv .npmrcbu .npmrc" # npmrc... come back!
