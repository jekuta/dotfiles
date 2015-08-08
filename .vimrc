" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" For vim-textobj-rubyblock
runtime macros/matchit.vim
if has("autocmd")
  filetype indent plugin on
endif

" Leader
let mapleader = " "

" Make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" Set line numbers
set relativenumber
set number

set backspace=2   " Backspace deletes like most programs in insert mode
set expandtab " Tab in insert mode will produce the appropriate number of spaces
set shiftwidth=2 " How many columns text is indented with the reindent operations (<< and >>)
set softtabstop=2 " How many columns vim uses when you hit Tab in insert mode
set autoindent " Copy the indentation from the previous line
" set foldmethod=syntax

" Easier split navigation
" http://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Start Vundler
filetype off " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-bufferline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'Julian/vim-textobj-brace'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ntpeters/vim-airline-colornum'
Plugin 'morhetz/gruvbox'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'edkolev/promptline.vim'
Plugin 'jelera/vim-javascript-syntax' 
Plugin 'Raimondi/delimitMate'

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Set 256 Colors
set term=xterm-256color

" Set colorscheme
let g:gruvbox_italic=0
colorscheme gruvbox
" Set dark gruvbox
set background=dark

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
  au!
  au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     execute 'normal! g`"zvzz' |
      \ endif
augroup END

" Airline
set laststatus=2
set linespace=0
let g:airline_theme="light"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

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

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:promptline_preset = {
      \'a'    : [ promptline#slices#host() ],
      \'b'    : [ '\$' ],
      \'c'    : [ promptline#slices#cwd() ],
      \'y'    : [ promptline#slices#vcs_branch() ],
      \'z'    : [ promptline#slices#git_status() ],
      \'warn' : [ promptline#slices#last_exit_code() ] }
