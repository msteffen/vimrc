### Installation

#### Approach 1: Run the setup script:

    curl https://raw.githubusercontent.com/msteffen/vimrc/master/setup.sh | bash

(see "Installing YCM" if you want YouCompleteMe as well)

#### Approach 2: Manual setup

1. Getting the vimrc file

   ```
   curl https://raw.githubusercontent.com/msteffen/vimrc/master/vimrc >~/.vimrc
   ```
    
1. Set up Vundle. See See <https://github.com/gmarik/Vundle.vim#about>

   ```
   git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
   ```
    
1. Run the following in bash:

   ```
   vim -c ":PluginInstall" -c ":qa"
   ```
    
See below for installing YouCompleteMe

#### Installing YouCompleteMe

By default, YouCompleteMe isn't installed by my .vimrc file (the "Plugin" line for YCM is commented out, at the bottom). If you want to use it, you'll need to put it in the vundle section at the top, and re-run `vim -c ":PluginInstall" -c ":qa"`. Then, you'll need to run the install script it downloads:

    # Put YCM plugin section at the top of .vimrc, then run:
    $ vim -c ":PluginInstall" -c ":qa"
    
    # Install build dependencies
    $ sudo apt update && sudo apt install -y build-essential cmake python-dev python3-dev
    # on arch:
    # echo "on arch:"
    # echo "sudo pacman -Syu clang make cmake python"
    # Install build tools (only necessary in a fresh VM with no build tools)
    # - Add --clang-completer if you don't care about C/C++ completion
    # - Omit --go-completer if you don't care about Go completion
    # - Omit --ts-completer if you don't care about Typescript completion
    $ ( cd ~/.vim/bundle/YouCompleteMe && ./install.py \
      --go-completer \
      --ts-completer
    ) 

### Cleanup
Just open vim and run `:PluginClean`. See `:help vundle` for more options (run `:PluginList` to see current plugins)

### TODO
* Put this setup in a script:

   ```
   git clone https://github.com/msteffen/vimrc.git ~/vim_setup && ~/vim_setup/setup.sh
   ```
    
