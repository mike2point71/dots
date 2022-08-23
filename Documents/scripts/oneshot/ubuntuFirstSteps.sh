#! /bin/sh

sudo apt update && sudo apt upgrade -y
alias ai="sudo apt install -y"
ai ufw
sudo ufw enable
ai curl wget git 

git clone --bare git@github.com:mike2point71/dots.git $HOME/.dotfiles
alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
cd $HOME


dtf checkout --recurse-submodules || {
  mkdir -p .config-backup && dtf checkout --recurse-submodules 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
  dtf checkout --recurse-submodules
}
dtf config --local status.showUntrackedFiles no

ai zsh 
~/Documents/scripts/rc/gbin/make-g-links

# RUST
ai build-essential libssl-dev clang cmake
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install starship

