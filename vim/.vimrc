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
Plug 'vim-scripts/taglist.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'pangloss/vim-javascript'

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
    autocmd! BufWritePost .vimrc nested source $MYVIMRC
endif

if &t_Co >= 256 || has("gui_running")
    set background=light
    colorscheme solarized
    "colorscheme mustang
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
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quote words under cursor
nnoremap <leader>" viW<esc>a"<esc>gvo<esc>i"<esc>gvo<esc>3l
nnoremap <leader>' viW<esc>a'<esc>gvo<esc>i'<esc>gvo<esc>3l

" Quote current selection
" TODO: This only works for selections that are created 'forwardly'
vnoremap <leader>" <esc>a"<esc>gvo<esc>i"<esc>gvo<esc>ll
vnoremap <leader>' <esc>a'<esc>gvo<esc>i'<esc>gvo<esc>ll

" Use shift-H and shift-L for move to beginning/end
nnoremap H 0
nnoremap L $

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type <leader>ah to toggle highlighting on/off.
"   http://vim.wikia.com/wiki/Auto_highlight_current_word_when_idle
nnoremap <leader>ah :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=300
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" guioptions
set guioptions-=r           " remove scrollbar
set guioptions-=R           " remove scrollbar
set guioptions-=l           " remove scrollbar
set guioptions-=L           " remove scrollbar
" Powerline setup
set guifont=Inconsolata-dz\ for\ Powerline:h12
set laststatus=2            " tell VIM to always put a status line in, even
                            "    if there is only one window

" Strip all trailing whitespace from a file, using ,W
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" C-U in insert/normal mode, to uppercase the word under cursor
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe

" klen/python-mode
let g:pymode_lint_checker = "pep8,pyflakes"
let g:pymode_lint_mccabe_complexity = 20
let g:pymode_rope = 0
let g:pymode_lint_minheight = 8
let g:pymode_lint_maxheight = 10
let g:pymode_lint_ignore = "C0110,F0401,W0403,E123,E124,E126"

" gitgutter colors
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

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

map <F2> :NERDTreeToggle<CR>

" Conflict markers {{{
" highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" shortcut to jump to next conflict marker
nnoremap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>
" }}}


