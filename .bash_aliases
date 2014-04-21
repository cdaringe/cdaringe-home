# config
alias vimrc="vim ~/.vimrc"
alias aliases="vim ~/.bash_aliases"

## file
alias purgedir="rm -rf .* *"
alias purgeswap="rm -rf ~/.vim/swapfiles"
alias home="cd ~"

## remote
alias mount10="sshfs cdieringer@neweb10: /Users/cdieringer/Documents/remote"
alias ssh10="ssh neweb10 -t screen"
alias list="screen -list"
alias web="cd /var/www/html"
alias scpTo10="scp $1 cdieringer@neweb10:~/"
alias scpTo10f="scp -r $1 cdieringer@neweb10:~/"
alias scpFrom10="scp cdieringer@neweb10:~/$1 ~/Desktop/"
alias scpFrom10f="scp -r cdieringer@neweb10:~/$1 ~/Desktop/"

## compression
alias untar="tar -xvf $1"

## apache
alias usrestart="sudo /etc/init.d/apache2 restart"
alias serverrestart="sudo /sbin/service httpd restart"
alias serverstop="sudo /sbin/service httpd stop"
alias serverstart="sudo /sbin/service httpd start"

alias serverconfcent="sudo vim /etc/httpd/conf/httpd.conf"
alias serverconfubu="sudo vim /etc/apache2/sites-enabled/000-default"
alias siteconfubu="sudo vim /etc/apache2/envvars"
alias sslconf="sudo vim /etc/httpd/conf.d/ssl.conf"

## node
alias unlock="sudo rm /var/run/node.lock /var/run/forever.lock"

#php
alias phpiniubu="sudo vim /etc/php5/apache2/php.ini"

## git
clonehere () {
    git init | git remote add origin $1 | git pull origin
}

## screen
# kill detached
killd () {
    screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
}
# kill all
killa () {
    screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
    screen -ls | grep tached | cut -d. -f1 | awk '{print $1}' | xargs kill
}

## osx only
alias showhidden="defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder"
alias dsoff="defaults write com.apple.desktopservices DSDontWriteNetworkStores true"
alias dson="defaults write com.apple.desktopservices DSDontWriteNetworkStores false"
