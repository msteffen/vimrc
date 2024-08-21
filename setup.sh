#!/bin/bash

which git || { sudo apt install git; }

# Copy Vundle & create YCM directory
config="${1:-vimrc}"
echo "Downloading vimrc..."
curl https://raw.githubusercontent.com/msteffen/vimrc/master/${config} >~/.vimrc
echo "Downloading vundle..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Installing plugins..."
vim -c ":PluginInstall" -c ":GoInstallBinaries" -c ":qa"

if [[ "${config}" =~ vimrc|vimrc_go_development ]]; then
  echo "Compiling YouCompleteMe with --go-completer (but not --clang-completer for C++)"
  cd ~/.vim/bundle/YouCompleteMe
  python3 ./install.py --go-completer
  cd -
else
  echo "See https://github.com/msteffen/vimrc/blob/master/README.md if you want to set up YouCompleteMe as well"
fi
