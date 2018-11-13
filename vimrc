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
" ctrlp - fuzzy file finder, etc
Plugin 'ctrlpvim/ctrlp.vim'
" fugitive.vim (Git plugin for vim)
Plugin 'tpope/vim-fugitive'
" GitGutter (displays git changes)
Plugin 'airblade/vim-gitgutter'
" Airline
Plugin 'vim-airline/vim-airline'
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
set mmp=10000 " Avoids bug where syntax highlighting large go files can fail
" Replace tabs with spaces -- not always necessary
set expandtab
set incsearch
syntax on

" Don't unindent comments in python
" TODO: install pep8 indentation rules for python
" See https://stackoverflow.com/questions/2360249/vim-automatically-removes-indentation-on-python-comments#comment12772473_2360284
au Filetype python inoremap # X<BS>#

""" Autocommands and autogroups
augroup format_on_write
  " au is just short form for autocmd. Like :w and :write. :au! clears other
  " autocommands in this autogroup, so that :source-ing my vimrc doesn't
  " cause autocommands to stack
  au!
  " Commands executed before writing a buffer to a file.
  " Clean up all trailing whitespace
  au BufWritePre .bashrc,*.cc,*.h,*.java,*.py,*.go,*.md,*.sh,*.json,*.proto silent! %s/[ 	]\+$//g
  " This is a good place to put autoformatting
  " For example: `au FileType markdown AutoFormatBuffer mdformat`
augroup END

augroup set_colorcolumn_on_filetype
  au!
  " Run `:set filetype?` to see the filetype for the current file
  au Filetype java set colorcolumn=101,102
  au Filetype cpp,python,go,proto set colorcolumn=81,82
augroup END

augroup relative_number_in_normal_mode
  au!
  au InsertEnter * :set number
  au InsertLeave * :set relativenumber
augroup END

" This is a function I added specifically to help when working on Pachyderm
" tests. Clients have a context, and often in tests I have to call
" alice.DoSomething(alice.Ctx(), ...). A common mistake I make in tests is:
" alice.DoSomething(bob.Ctx(), ...) (typically a copy/paste error). This
" autocommand catches those types of errors
function! Highlight_silly_ctx_error()
  hi Error ctermbg=Red
  match Error /\(\<[a-z]\w\+\)\.[A-Z]\w\+(\(\1\)\@!\w\+\.Ctx()/
endfunction
augroup catch_mismatched_ctx_errors_go
  au!
  au Filetype go call Highlight_silly_ctx_error()
augroup END

hi ColorColumn ctermbg=Gray ctermfg=Black guibg=gray9

" Fix syntastic coloring that blends in with my highlight
" http://stackoverflow.com/questions/17677441/changing-error-highlight-color-used-by-syntasti
hi SpellBad ctermfg=Black ctermbg=Red
hi SpellCap ctermfg=Black ctermbg=Yellow

" highlight all occurrences of a match (like emacs)
hi Search ctermbg=DarkYellow
" Search terms stay highlighted after search is done, until I move the cursor
set hlsearch
" Type <space> to clear search highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Search is case-insensitive, unless it contains uppercase letters
set ignorecase
set smartcase

" Highlight trailing whitespace
match Search /\s\+$/


""""" Optional (i.e. heavyweight) plugins """""
""" Git extensions (only useful if working with git)
" fugitive.vim (Git plugin for vim)
" Plugin 'tpope/vim-fugitive'

""" Error highlighting
" Syntastic: error highlighting
" Plugin 'vim-syntastic/syntastic'

""" YouCompleteMe
" YCM must be independently compiled before it can be used.
" See github.com/msteffen/vimrc/README.md for additional installation steps
" YouCompleteMe (autocomplete)
" Plugin 'Valloric/YouCompleteMe'

""" Go extentions (place this in the vundle section)
" Extra tools for go programming (including go.vim for syntax highlighting)
" (Make sure to run :GoInstallBinaries if you install this)
" Plugin 'fatih/vim-go'

""" Go options (place these at the end of the file, after vundle#end())
" let g:go_fmt_command = "goimports"
" let g:syntastic_go_checkers = ['go', 'golint', 'govet -composites=false', 'errcheck']
" let g:syntastic_go_checkers = ['golint', 'govet -composites=false', 'errcheck']
" let g:syntastic_check_on_wq = 0  " Normally syntastic checks on writes, but don't check on 'wq'
" let g:go_list_type = "quickfix"
" let g:go_autodetect_gopath = 0 " For some reason, if I don't set this, my GOPATH is modified and imports fail to resolve
