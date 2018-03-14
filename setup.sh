#!/bin/bash

which git || { sudo apt install git; }

# Copy Vundle & create YCM directory
echo "Downloading vimrc..."
curl https://raw.githubusercontent.com/msteffen/vimrc/master/${1:-vimrc} >~/.vimrc
echo "Downloading vundle..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Installing plugins..."
vim -c ":PluginInstall" -c ":GoInstallBinaries" -c ":qa"
echo "See https://github.com/msteffen/vimrc/blob/master/README.md if you want to set up YouCompleteMe as well"
