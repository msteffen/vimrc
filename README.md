### Installation

1. Getting the vimrc file

    ```
    curl https://raw.githubusercontent.com/msteffen/vimrc/master/vimrc >$HOME/.vimrc
    ```

1. Open vim and run `:PluginInstall` once. This should finish successfully; quit afterwards.

1. Installing YouCompleteMe

    ```
    # Install build tools (only in a fresh VM with no build tools)
    > sudo apt-get install build-essential cmake python-dev
    > cd ~/.vim/bundle/YouCompleteMe

    # omit --clang-completer if you don't care about C/C++ completion
    > ./install.sh --clang-completer
    ```

### TODO
* Put this setup in a script:

```
git https://github.com/msteffen/vimrc.git ~/vim_setup && ~/vim_setup/setup.sh
```
