#!/bin/bash
alias sourceme="source ~/.bash_profile"

# docker
alias docker-cleanup="docker run -d -v /var/run/docker.sock:/var/run/docker.sock:rw -v /var/lib/docker:/var/lib/docker:rw --env KEEP_IMAGES='ubuntu:trusty, ubuntu:latest, node, node:slim' meltwater/docker-cleanup:latest"

# essentials™
alias gamedie="echo 🎲 | pbcopy"

# config
export EDITOR='vim' #default
alias gobash="chsh -s $(which bash) $USER"
alias sed-replace="echo \"sed -i '' 's/::find::/::replace::/' **/*.js\""

# sys
alias sudoers="sudo vim /etc/sudoers"
alias useradd="echo \"Did you mean to perform adduser?\""
alias shasum="sha1sum"

export BACKUP_FOLDER=~/Google\ Drive/backup
function backupdroplet () {
  rsync -avz --exclude-from "$BACKUP_FOLDER/exclude.txt"  root@$DROPLET_JR_IP:/www/ "$BACKUP_FOLDER/www";
}

# file
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ll='ls -alFG'
alias la='ls -AG'
alias l='ls -CFG'

## database
alias pglogon="sudo -u postgres psql"

## remote
coc () { ssh -l cdieringer3 cc-shuttle2.cc.gatech.edu; }

alias rmateclog="echo 'Kill process using 52698 (kill ###)'; sudo netstat -antpl  | grep 52698"

# git
alias bumpci="git commit --allow-empty -m 'chore(pkg): bump ci'"
alias gum="git branch -u origin/master"
alias gs="git status"
alias gpm="git pull origin master"
alias gpush="git push origin $1";
alias gp="git pull"
alias gpum="git push --set-upstream origin master"
alias gl="git log"
alias gbl="git branch --list"
alias gba="git branch --list -a"
alias gc="git checkout"
alias gcm='git checkout master'
alias gd='git diff --ignore-space-change --ignore-all-space'
alias gh="git config --get remote.origin.url"
alias gpurgebranches="confirm 'Purge all non-current git branches?' && git branch --merged | grep -v \* | xargs git branch -D"

ballervim () {
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
    cd ~/.vim/bundle && \
    rm -rf vim-colors-solarized && git clone git://github.com/altercation/vim-colors-solarized.git && \
    rm -rf syntastic && git clone https://github.com/scrooloose/syntastic.git && \
    rm -rf vdebug && git clone git@github.com:joonty/vdebug.git
}
alias git-config-cdaringe="git config --global user.name cdaringe && git config --global user.email christopher.dieringer@gmail.com && git config --global core.editor vim && git config --global push.default current"
alias git-config-gatech="git config --global user.name cdieringer3 && git config --global user.email cdieringer3@gatech.edu && git config --global core.editor vim && git config --global push.default current"

## compression
alias untar="tar -xvf $1"

#** SERVER **#
alias syslog="$EDITOR /var/log/syslog"
alias ports="sudo netstat -plunt"

if [[ $OS == 'Darwin' ]]; then
    ## osx only
    alias showhidden="defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder"
    alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder"
    alias dsoff="defaults write com.apple.desktopservices DSDontWriteNetworkStores true"
    alias dson="defaults write com.apple.desktopservices DSDontWriteNetworkStores false"

    adduser() {
      sudo dseditgroup -o edit -a $1 -t user $2
    }

    export PATH=/home/$USER/node/selenium_drvers_osx/:$PATH
fi

# vim
alias vimrc="$EDITOR ~/.vimrc"
alias aliases="$EDITOR ~/.aliases.sh"
alias secrets="$EDITOR ~/.secrets.sh"
function bananas () {
  echo 'fruits';
}
function uall () {
  echo '[cd] Updating cdaringe-home profile...';
  cd ~;
  echo '[cd] Adding key profile files...';
  git add .gitignore .aliases.sh .common.sh .env.sh .bash_profile .bashrc .vimrc .editorconfig -f;
  echo '[cd] Committing...';
  git commit -m 'Config updates';
  echo '[cd] Merging...';
  gp;
  echo '[cd] Pushing...';
  git push origin master;
  echo '[cd] patches submitted successfully!'
  sourceme;
}

## node
export PATH=$PATH:$HOME/bin:/usr/local/bin/npm
export PATH=/home/$USER/node/:$PATH

## npm
alias nga="mv .npmrc .npmrcbu" # npmrc... go away!
alias ncb="mv .npmrcbu .npmrc" # npmrc... come back!

#install rmate
alias getrmate="curl -Lo ~/rmate https://raw.github.com/textmate/rmate/master/bin/rmate && sudo chmod a+x ~/rmate"
# to connect, ssh -R 52698:localhost:52698 user@yourServer. or, .ssh/config specify this

# unix generic
alias network="sudo $EDITOR /etc/network/interfaces"
alias powerdown="sudo shutdown -hP -t 1 now"

# Get weird
echo "🌲 🌲  CHA-CHING! ${NICKNAME:=$USER} is runnin' $OS $VER $BITS-bit ($ARCTCTR) 🌲 🌲"

function movToGif() {
  `ffmpeg -i $1 -pix_fmt rgb24 -r 5 -f gif - | gifsicle --optimize=4 --delay=20 > $1.gif`;
}

# dirsize
function dir-size () {
  du -L -h -d 1 $1 | gsort -h;
}

alias fedora="ssh -p 1122 cdieringer@127.0.0.1";

function nrc () {
  echo "activating $1"
  npmrc $1;
  sourceme;
}

confirm () {
  # call with a prompt string or use a default
  read -r -p "${1:-Are you sure? } [yN] " response
  case $response in
    [yY][eE][sS]|[yY])
      true
      ;;
    *)
      false
      ;;
  esac
}

function shutdown() {
  while true; do
    read -p "Do you wish to shutdown host: $(hostname)? [yn]" yn
    case $yn in
      [Yy]*)
        $(which shutdown) $@
        return 0;;
      [Nn]*) return 1;;
      *) echo "Please answer yes or no.";;
    esac
  done
}

function random-string () {
  cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z' | fold -w $1 | head -n 1
}
function random-filename () {
  echo $(random-string 15).$(random-string 3)
}
function encrypt-file () {
  local DEST=$(random-filename);
  eval "gpg --output $DEST --symmetric --cipher-algo AES256 $1";
  echo "file written to $DEST";
}
function decrypt-file () {
  gpg --output $2 --decrypt $1
}

weather() { curl wttr.in/"$1"; }
alias myip="curl icanhazip.com"
### plz: re-run the last command as root.
alias plz="fc -l -1 | cut -d' ' -f2- | xargs sudo"

get-vagrant-ip () {
  vagrant ssh -c "hostname -I | cut -d' ' -f2" 2>/dev/null
}
