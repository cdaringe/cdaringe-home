alias purgedir="rm -rf .* *"
alias purgeswap="rm -rf ~/.vim/swapfiles"

alias vimrc="vim ~/.vimrc"
alias aliases="vim ~/.bash_aliases"

alias mount10="sshfs cdieringer@neweb10: /Users/cdieringer/dev/"
alias ssh10="ssh neweb10 -t screen"
alias list="screen -list"

# osx only
alias showhidden="defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder"

alias web="cd /var/www/html"
alias home="cd ~"

alias untar="tar -xvf $1"

alias serverrestart="sudo /sbin/service httpd restart"
alias serverstop="sudo /sbin/service httpd stop"
alias serverstart="sudo /sbin/service httpd start"

alias serverconf="sudo vim /etc/httpd/conf/httpd.conf"
alias sslconf="sudo vim /etc/httpd/conf.d/ssl.conf"

clonehere () {
    git init | git remote add origin $1 | git pull origin
}

killd () {
    screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
}

killa () {
    screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
    screen -ls | grep tached | cut -d. -f1 | awk '{print $1}' | xargs kill
}
