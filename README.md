### Installation

1. Getting the vimrc file

    ```
    curl https://raw.githubusercontent.com/msteffen/vimrc/master/vimrc >$HOME/.vimrc
    ```

1. Set up Vundle. See See <https://github.com/gmarik/Vundle.vim#about>

    ```
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ```

1. Open vim and run `:PluginInstall` once. This should finish successfully; quit afterwards.

1. Installing YouCompleteMe
    Uncomment the line `" Plugin 'Valloric/YouCompleteMe'` in vimrc. Then run:

    ```
    # Install build tools (only in a fresh VM with no build tools)
    > sudo apt-get install build-essential cmake python-dev
    > cd ~/.vim/bundle/YouCompleteMe

    # omit --clang-completer if you don't care about C/C++ completion
    > ./install.sh --clang-completer
    ```

### Cleanup
Just open vim and run `:PluginClean`. See `:help vundle` for more options (run `:PluginList` to see current plugins)

### TODO
* Put this setup in a script:

    ```
    git https://github.com/msteffen/vimrc.git ~/vim_setup && ~/vim_setup/setup.sh
    ```
