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
"Plugin 'Valloric/YouCompleteMe'
Plugin 'terryma/vim-multiple-cursors'

"syntax plugins
Plugin 'tpope/vim-fugitive'
Plugin 'elzr/vim-json'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5-syntax.vim'
Plugin 'tpope/vim-markdown'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'tpope/vim-haml'
Plugin 'jQuery'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
set t_Co=256

set mouse=a

syntax enable
set background=dark
"colorscheme solarized

"let user_emmet_expandabbr_key = '<c-e>'
map <C-t> :NERDTreeToggle<CR>
"always display airline
set laststatus=2
