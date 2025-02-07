#!/bin/bash

# Install vim-nox (vim + support for scripting languages)
which vim || { sudo apt install -y vim-nox; }

# Install git (required by Vundle)
which git || { sudo apt install -y git; }

# Copy Vundle & create YCM directory
config="${1:-vimrc}"
echo "Downloading vimrc..."
curl https://raw.githubusercontent.com/msteffen/vimrc/master/${config} >~/.vimrc
echo "Downloading vundle..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Installing plugins..."
vim -c ":PluginInstall" -c ":GoInstallBinaries" -c ":qa"

if [[ "${config}" =~ vimrc|vimrc_go_development ]]; then
  #  From https://github.com/ycm-core/YouCompleteMe#installation
  echo "Installing YCM deps"
  sudo apt install -y build-essential cmake python3-dev
  
  echo "Compiling YouCompleteMe with --go-completer and --ts-completer"
  echo "(but not --clang-completer for C++)"
  cd ~/.vim/bundle/YouCompleteMe
  python3 ./install.py --go-completer --ts-completer
  cd -
else
  echo "See https://github.com/msteffen/vimrc/blob/master/README.md if you want to set up YouCompleteMe as well"
fi
