""" Vundle configuration and packages
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Multiple Cursors
Plugin 'terryma/vim-multiple-cursors'
" (tweaks)
" Typing ESC in insert or visual mode doesn't lose your cursors. You have to go
" to normal mode to drop them
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
" Make numbers work when replaying normal mode commands for multiple cursors
" This is the default value (as documented on terryma's github page) plus the
" digits
let g:multi_cursor_normal_maps = {
    \ '!':1, '@':1, '=':1, 'q':1, 'r':1, 't':1, 'T':1, 'y':1, '[':1, ']':1,
    \ '\':1, 'd':1, 'f':1, 'F':1, 'g':1, '"':1, 'z':1, 'c':1, 'm':1, '<':1,
    \ '>':1, '0':1, '1':1, '2':1, '3':1, '4':1, '5':1, '6':1, '7':1, '8':1,
    \ '9':1
    \ }

" Surround.vim (surround text with "([{' etc)
Plugin 'tpope/vim-surround'
" Repeat.vim (some plugins work with '.')
Plugin 'tpope/vim-repeat'

call vundle#end()
filetype plugin indent on    " required
                             " To ignore plugin indent changes, instead use:
                             " `filetype plugin on`

""" General options
set smartindent
set ai
set tabstop=2
set shiftwidth=2
set number
set ruler
set relativenumber
" Replace tabs with spaces -- not always necessary
set expandtab
syntax on

""" Autocommands and autogroups
augroup format_on_write
  " au is just short form for autocmd. Like :w and :write. :au! clears other
  " autocommands in this autogroup, so that :source-ing my vimrc doesn't
  " cause autocommands to stack
  au!
  " Commands executed before writing a buffer to a file.
  " Clean up all trailing whitespace
  au BufWritePre *.cc,*.h,*.java,*.py,*.go,*.md,*.sh silent! %s/[ 	]\+$//g
  " This is a good place to put autoformatting
  " For example: `au FileType markdown AutoFormatBuffer mdformat`
augroup END

augroup set_colorcolumn_on_filetype
  au!
  " Run `:set filetype?` to see the filetype for the current file
  au Filetype java set colorcolumn=101,102
  au Filetype cpp set colorcolumn=81,82
augroup END

augroup relative_number_in_normal_mode
  au!
  au InsertEnter * :set number
  au InsertLeave * :set relativenumber
augroup END

hi ColorColumn ctermbg=Gray ctermfg=Black guibg=gray9

""" Search and highlighting
" Fix syntastic coloring that blends in with my highlight
" http://stackoverflow.com/questions/17677441/changing-error-highlight-color-used-by-syntasti
hi SpellBad ctermfg=Black ctermbg=Red
hi SpellCap ctermfg=Black ctermbg=Yellow

" highlight all occurrences of a match (like emacs)
hi Search ctermbg=DarkYellow
set hlsearch

" Highlight trailing whitespace
match Search /\s\+$/

" Type <space> to clear search highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

""""" Optional (i.e. heavyweight) plugins """""
""" YouCompleteMe
" YouCompleteMe (autocomplete)
" Plugin 'Valloric/YouCompleteMe'

""" Codefmt
" Add maktaba and codefmt to the runtimepath. (The latter must be installed
" before it can be used.)
"
" I haven't tried these out yet and am afraid to uncomment them, but they're
" here as a quick reference
"
" Plugin 'google/vim-maktaba'
" Plugin 'google/vim-codefmt'
" " Also add Glaive, which is used to configure codefmt's maktaba flags. See
" " `:help :Glaive` for usage.
" Plugin 'google/vim-glaive'
" call glaive#Install()

""" Go extentions
" Extra tools for go programming (including go.vim for syntax highlighting)
" Plugin 'fatih/vim-go'
" Set runtime path to include go vim extras
" set rtp+=$GOROOT/misc/vim
