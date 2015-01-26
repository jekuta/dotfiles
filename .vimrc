" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Leader
let mapleader = " "

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Set line numbers
set relativenumber 
set number 

set backspace=2   " Backspace deletes like most programs in insert mode
set expandtab " Tab in insert mode will produce the appropriate number of spaces
set shiftwidth=2 " How many columns text is indented with the reindent operations (<< and >>)
set softtabstop=2 " How many columns vim uses when you hit Tab in insert mode
set autoindent " Copy the indentation from the previous line

" Start Vundler
filetype off " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'thoughtbot/vim-rspec'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Set 256 Colors
set t_Co=256

" Airline
set laststatus=2
let g:airline_theme="light"
let g:airline_powerline_fonts=2

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Yggdroot IndentLine color
let g:indentLine_color_term = 239

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
