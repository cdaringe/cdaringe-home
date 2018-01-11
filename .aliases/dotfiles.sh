function uall () {
  echo '[cd] Updating cdaringe-home profile...';
  cd ~;
  echo '[cd] Adding key profile files...';
  git add .gitignore .aliases/* .env/* .work.sh .common.sh .env.sh .bash_profile .bashrc .vimrc .editorconfig .shell.sh -f;
  echo '[cd] Committing...';
  git commit -m 'Config updates';
  echo '[cd] Merging...';
  gp;
  echo '[cd] Pushing...';
  git push origin master;
  echo '[cd] patches submitted successfully!'
  sourceme;
}
