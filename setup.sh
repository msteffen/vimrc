#!/bin/bash

# Copy Vundle & create YCM directory
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install YCM
sudo apt-get install build-essential cmake python-dev
echo -e ":PluginInstall\n:q" | vim -e # Starts vim in ex mode
# I haven't really tried the above in a totally fresh install,
# so maybe this works better:
# vim -c ":PluginInstall" -c ":qa" (or something similar)
(cd ~/.vim/bundle/YouCompleteMe && ./install.sh)
