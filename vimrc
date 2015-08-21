set nocompatible
filetype off

"vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

"cool things
"Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesToggle' }
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'    }
"Plug 'mattn/emmet-vim'
"Plug 'itchyny/lightline.vim'
Plug 'bling/vim-airline'
"Plug 'terryma/vim-multiple-cursors'

"syntax plugins
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5-syntax.vim'
Plug 'tpope/vim-markdown'
Plug 'jelera/vim-javascript-syntax'
Plug 'nanotech/jellybeans.vim'
if v:version >= 703
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'mbbill/undotree',  { 'on': 'UndotreeToggle'   }
endif

"snippets
"Plug 'ervandew/supertab'
"if has('python')
"Plug 'SirVer/ultisnips'
"endif
"Plug 'honza/vim-snippets'

"GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"Cool shiznit
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary',        { 'on': '<Plug>Commentary' }

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
filetype plugin on
set t_Co=256

syntax enable
set number
set background=dark
colorscheme jellybeans

"tabs
"size of a hard tabstop
set tabstop=4
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab
" always uses spaces instead of tab characters
set expandtab


" Linebreak on 500 characters
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" vimrc in a new wertical window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
set switchbuf=useopen,usetab,newtab
set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal! g`\"" |
\ endif

" Remember info about open buffers on close
set viminfo^=%

"Persistent undo

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

" undotree
let g:undotree_WindowLayout = 2
nnoremap U :UndotreeToggle<CR>

"airline
set laststatus=2
"let g:airline_powerline_fonts = 1
"airline buffer list
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
set timeoutlen=50
"set noshowmode


"Omnicomplete
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

"Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" Set to auto read when a file is changed from the outside
set autoread

" Switch to paste mode with F2
set pastetoggle=<F2>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Turn on the WiLd menu
set wildmenu

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" " Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" " In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
set mouse=a
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac

" <F10> | NERD Tree
" inoremap <F10> <esc>:NERDTreeToggle<cr>
" nnoremap <F10> :NERDTreeToggle<cr>
" let g:NERDTreeShowHidden=1

" NETRW
nnoremap <F10> :Lexplore<cr>

" absolute width of netrw window
let g:netrw_winsize = -38

" do not display info on the top of window
let g:netrw_banner = 0

" tree-view
let g:netrw_liststyle = 3

" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

" use the previous window to open file
let g:netrw_browse_split = 4

" vim-commentary
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

