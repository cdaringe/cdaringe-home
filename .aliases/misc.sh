function movToGif() {
  `ffmpeg -i $1 -pix_fmt rgb24 -r 5 -f gif - | gifsicle --optimize=4 --delay=20 > $1.gif`;
}

function random-string () {
  cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z' | fold -w $1 | head -n 1
}

weather() { curl wttr.in/"$1"; }

get-vagrant-ip () {
  vagrant ssh -c "hostname -I | cut -d' ' -f2" 2>/dev/null
}
alias sourceme="source ~/.bash_profile"
alias gamedie="echo 🎲 | pbcopy"
alias aliases="$EDITOR ~/.aliases.sh"
alias secrets="$EDITOR ~/.secrets.sh"

function uall () {
  echo '[cd] Updating cdaringe-home profile...';
  cd ~;
  echo '[cd] Adding key profile files...';
  git add .gitignore .aliases/* .work.sh .common.sh .env.sh .bash_profile .bashrc .vimrc .editorconfig .shell.sh -f;
  echo '[cd] Committing...';
  git commit -m 'Config updates';
  echo '[cd] Merging...';
  gp;
  echo '[cd] Pushing...';
  git push origin master;
  echo '[cd] patches submitted successfully!'
  sourceme;
}


