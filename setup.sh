#!/bin/bash

# tempfile with vimscript for installing Vundle, etc
tf=$(mktemp -p.)
printf "PluginInstall\nqa" >${tf}

# Copy Vundle & create YCM directory
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# for some reason, vim -c "PluginInstall | qa" doesn't seem to do the right
# thing. If I can figure out how to fix it, then fix it (tempfiles are gross)
vim -S ${tf}

# Install YCM
sudo apt-get install build-essential cmake python-dev
(cd ~/.vim/bundle/YouCompleteMe && ./install.sh)
vim -S ${tf}

rm ${tf}
