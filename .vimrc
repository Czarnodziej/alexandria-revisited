set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"main
Plugin 'gmarik/Vundle.vim'

"cool things
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'

"syntax plugins
Plugin 'tpope/vim-fugitive'
Plugin 'elzr/vim-json'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5-syntax.vim'
Plugin 'tpope/vim-markdown'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-repeat'
Plugin 'jQuery'
"Plugin 'Shougo/neocomplete'

"Cool shiznit
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ap/vim-css-color'
Plugin 'Rykka/colorv.vim'
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

"Repos from vim-scripts
Plugin 'closetag.vim'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
set t_Co=256

set mouse=a

syntax enable
set number
set background=dark
"let g:solarized_termcolors=256
colorscheme solarized
let g:netrw_liststyle=3

"tabs
"size of a hard tabstop
set tabstop=4
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4
" " make "tab" insert indents instead of tabs at the beginning of a line
set smarttab
" always uses spaces instead of tab characters
set expandtab

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
 
"let user_emmet_expandabbr_key = '<c-e>'
map <C-t> :NERDTreeToggle<CR>
"always display airline
set laststatus=2

"lines
:nmap j gj
:nmap k gk
"search
:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap \q :nohlsearch<CR>
