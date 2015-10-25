"{{{Vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Main
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesToggle' }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle','NERDTreeFind']   }
Plug 'scrooloose/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'scrooloose/syntastic'
Plug 'ap/vim-css-color'
Plug 'rking/ag.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'godlygeek/tabular'
"Plug 'edkolev/tmuxline.vim'

" Syntax plugins
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5-syntax.vim'
Plug 'plasticboy/vim-markdown'
Plug 'jelera/vim-javascript-syntax'
Plug 'tmux-plugins/vim-tmux'
Plug 'sheerun/vim-polyglot'

" Snippets
if v:version >= 704
  Plug 'SirVer/ultisnips'
endif
Plug 'honza/vim-snippets'

"Theme
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'

if v:version >= 703
Plug 'mbbill/undotree',  { 'on': 'UndotreeToggle'   }
Plug 'pangloss/vim-javascript'
endif

" Completion
if has('lua') && (v:version > 703)
Plug 'Shougo/neocomplete.vim'
endif
Plug 'ervandew/supertab'

" GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call plug#end()
" }}}
"{{{Basics
syntax on
set number
set background=dark
"colorscheme jellybeans
let base16colorspace=256
colorscheme base16-default

set nocompatible
filetype plugin indent on
set showcmd

"tmux fix
if &term =~ '256color'
  set t_ut=
endif

" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
"set smarttab
set expandtab
set autoindent

" Search
set ignorecase smartcase
set hlsearch incsearch
set showmatch

" Backup
set nobackup
set nowb
set noswapfile

set linebreak
set wrap

set wrapscan

set history=100
set autoread

set scrolloff=3

set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

" Markdown filetype
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
let g:vim_markdown_folding_disabled=1

" conf filetype
autocmd BufRead,BufNewFile *.conf setf dosini

" Return to last edit position when opening files
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal! g`\"" |
\ endif

" Remember info about open buffers on close
set viminfo^=%

" Persistent undo

if has('persistent_undo')
  let undodir = expand("~/.vim/undos/$USER")
  if !isdirectory(undodir)
    call mkdir(undodir, "p")
  endif
  set undodir=~/.vim/undos/$USER/
  set undofile
  set undolevels=100000 "maximum number of changes that can be undone
  set undoreload=100000 "maximum number lines to save for undo on a buffer reload
endif

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType help wincmd L

let $LANG='en_US.UTF-8'
language en_US.UTF-8

set wildmode=longest:full,full
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set ruler
set cmdheight=2
set hid
set backspace=indent,eol,start " make that backspace key work the way it should
if has('mouse')
  set mouse=a
endif

set lazyredraw
set magic
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1
set encoding=utf8

"set foldmethod=marker

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"}}}
"{{{PLUGINS

" undotree
let g:undotree_WindowLayout = 2

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
"let g:airline_theme='base16'
set timeoutlen=300
set noshowmode
"let g:bufferline_echo = 0
"autocmd VimEnter *
  "\ let &statusline='%{bufferline#refresh_status()}'
  "\ .bufferline#get_status_string()

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Aggregate errors for multiple checkers
let g:syntastic_aggregate_errors = 1

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers = ['eslint']
" npm install -g jshint jslint jsonlint js-yaml

" NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

" }}}
" {{{ NEOCOMPLETE"

if !empty(glob("~/.vim/plugged/neocomplete.vim/plugin/neocomplete.vim"))
" Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
" Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
" Use smartcase.
  let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
  endfunction
" <TAB>: completion.
"  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
endif
"}}}
"{{{ Mappings

nmap <silent> <c-p> :FZF<CR>

" Set leader to 'space'
let mapleader = "\<Space>"
"let g:mapleader = " "

nmap <leader>w :w!<cr>
nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <silent> <leader>b :NERDTreeFind<CR>

nmap <silent> <leader>u :UndotreeToggle<CR>
nmap <silent> <leader>p :set paste!<CR>
nmap <silent> <leader>f :FZF<CR>
nmap <silent> <leader>i :IndentLinesToggle<cr>

vmap <leader>e <Plug>(emmet-expand-abbr)
nmap <leader>e <Plug>(emmet-expand-abbr)


" ctrl-c as esc
inoremap <C-c> <Esc><Esc>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
" }}}
