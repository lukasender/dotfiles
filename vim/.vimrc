" Use vim instead of vi settings.
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins unter the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#infect()

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-characterize'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/powerline', { 'rtp': 'powerline/bindings/vim/' }
"Plug 'altercation/vim-colors-solarized'

call plug#end() " handles 'filetype off', 'filetype plugin indent on' and
                " 'syntax on' automatically

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $VIMRC<CR>
nmap <silent> <leader>sv :so $VIMRC<CR>

set encoding=utf-8
set termencoding=utf-8

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
set smarttab                    " insert tabs on the start of a line according
                                " to shiftwidth, not tabstop
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
" use Perl/Python compativle regex formatting
" Thanks to Steve Losh for this liberating tip
" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v
vnoremap / /\v
" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

set nobackup
set noswapfile
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)
set wildmenu
set wildmode=list:longest
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep

set showmode
set showcmd
set cursorline                  " highlight cursor line
set cmdheight=2                 " use a status bar that is 2 rows high

set ttyfast                     " indicate a fast connection

if has('autocmd')
    autocmd filetype python set expandtab
endif

if &t_Co >= 256 || has("gui_running")
    "set background=light
    "colorscheme solarized
    colorscheme mustang
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

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" guioptions
set guioptions-=r           " remove scrollbar
set guioptions-=R           " remove scrollbar
set guioptions-=l           " remove scrollbar
set guioptions-=L           " remove scrollbar
" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2            " tell VIM to always put a status line in, even
                            "    if there is only one window

" Strip all trailing whitespace from a file, using ,W
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" NERDTree settings {{{
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$' ]

" }}}

" Conflict markers {{{
" highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" shortcut to jump to next conflict marker
nnoremap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>
" }}}


