#!/bin/sh

current_dir=`pwd`
vimdir="vim"
vimrc="vimrc"
#screenrc="screenrc"
tmuxconf="tmux.conf"
#dircolors="dir_colors"

# The function to make symbolic link
# Arguments
# $1 : target of symlink path
# $2 : linked file path
function makeSymLink() {
  if [ -e "$1"]; then
    echo "$1 is already exists"
  else
    case "$0" in
      /*) cur=`dirname "$0"` ;;
      *) cur=`dirname "$PWD/$0"` ;;
    esac
    ln -s $cur$2 $1
    if [ $? -eq 0 ]; then
      echo "create symlink $1"
    fi
  fi
}

if [ $# -gt 0 ] ;then
  dir=$1
else
  dir="${HOME}/"
fi


# Create SymbolicLinks
makeSymLink "${dir}.${vim}" ""
makeSymLink "${dir}.${vimrc}" "/${vimrc}"
makeSymLink "${dir}.${tmuxconf}" "/${tmuxconf}"
#makeSymLink "${dir}.${dircolors}" "/${dircolors}"


# Install Management tool of vim-plugins
# git clone neobundle.vim
# git clone https://github.com/Shougo/neobundle.vim ~/.vim/neobundle.vim.git
# git clone vundle.vim
git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
# git clone vim-pathogen
#git clone https://github.com/tpope/vim-pathogen
