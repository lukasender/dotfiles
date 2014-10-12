" Use vim instead of vi settings.
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins unter the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#infect()

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $VIMRC<CR>
nmap <silent> <leader>sv :so $VIMRC<CR>

set encoding=utf-8

set hidden                      " hide buffers instead of closing them
set nowrap                      " to not wrap lines
set tabstop=4                   " a tab is four spaces
set softtabstop=4
set expandtab
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set relativenumber
set ruler
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                   " set show matching parenthesis
set scrolloff=5                 " keep <nr> of lines visible when scrolling
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase
                                " case-sensistive otherwise
set smarttab                    " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
" use Perl/Python compativle regex formatting
nnoremap / /\v
vnoremap / /\v

set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set wildmenu
set wildmode=list:longest
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep

set nobackup
set noswapfile

set showmode
set showcmd
set cursorline                  " highlight cursor line
set laststatus=2

set ttyfast                     " indicate a fast connection

filetype plugin indent on

if has('autocmd')
    autocmd filetype python set expandtab
endif

if &t_Co >= 256 || has("gui_running")
    colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
    syntax on
endif

set list
set listchars=tab:··,trail:·,extends:#,nbsp:·

nnoremap - :
" clear the search buffer by simply pressing '//' twice
nmap <silent> // :nohlsearch<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
" http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
cmap w!! w !sudo tee > /dev/null %

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" window management
nnoremap <leader>w <C-w>v
nnoremap <leader>s <C-w>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" guioptions
set guioptions-=r           " remove scrollbar
set guioptions-=R           " remove scrollbar
set guioptions-=l           " remove scrollbar
set guioptions-=L           " remove scrollbar
