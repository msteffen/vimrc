" Vundle configuration and packages
" Set up Vundle with
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" See https://github.com/gmarik/Vundle.vim#about
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" YouCompleteMe (autocomplete)
" Make sure to compile (after running PluginInstall once to download the repo):
" > sudo apt-get install build-essential cmake python-dev
" > cd ~/.vim/bundle/YouCompleteMe
" > ./install.sh --clang-completer # omit --clang-completer if you don't care
" 																 # about C/C++ completion
Plugin 'Valloric/YouCompleteMe'
" Extra tools for go programming (including go.vim for syntax highlighting)
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"                     auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smartindent
set ai
set tabstop=2
set shiftwidth=2
set number
set ruler

hi ColorColumn ctermbg=Gray ctermfg=Black guibg=gray9
" Highlight columns after 80. Someday, learn how to vary this with filetype
" This is how I have it set up at work, but I don't like that textwidth
" inserts newlines, so instead I leave textwidth off and set colorcolumn in
" absolute terms
"set textwidth=80
"set colorcolumn=+1,+2
set colorcolumn=81,82

" Fix syntastic coloring that blends in with my highlight
" See
" http://stackoverflow.com/questions/17677441/changing-error-highlight-color-used-by-syntasti
hi SpellBad ctermfg=Black ctermbg=Red
hi SpellCap ctermfg=Black ctermbg=Yellow

set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on