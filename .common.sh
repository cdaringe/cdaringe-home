if [ -f ~/.secrets.sh ]; then
    . ~/.secrets.sh
fi

if [ -f ~/.env.sh ]; then
    . ~/.env.sh
fi

if [ -f ~/.aliases.sh ]; then
    . ~/.aliases.sh
fi

# git
`git config --global color.ui auto`

# bin
if [ -f ~/bin/rmate ]; then
    export PATH="$PATH:$HOME/bin"
fi

if hash yarn 2>/dev/null; then
  export PATH="$PATH:`yarn global bin`"
fi

export ANSIBLE_STDOUT_CALLBACK=debug #https://gist.github.com/cliffano/9868180#gistcomment-1915662
