" Use vim instead of vi settings.
set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeClose', 'NERDTreeFocus'] }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-characterize'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/powerline', { 'rtp': 'powerline/bindings/vim/' }
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'
Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/dbext.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'terryma/vim-expand-region'
" JavaScript Plugins
Plug 'jelera/vim-javascript-syntax'
Plug 'elzr/vim-json'
" themes
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'
" git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'

call plug#end() " handles 'filetype off', 'filetype plugin indent on' and
                " 'syntax on' automatically

" change the mapleader from \ to ,
let mapleader="\<Space>"

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $VIMRC<CR>
nmap <silent> <leader>sv :so $VIMRC<CR>

set encoding=utf-8
set termencoding=utf-8

set hidden                      " hide buffers instead of closing them
set nowrap                      " do not wrap lines
set tabstop=4                   " a tab is four spaces
set softtabstop=4
set expandtab
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set relativenumber
nnoremap <F3> :set nonumber! norelativenumber!<CR>
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

set timeoutlen=500

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
set lazyredraw

if has('autocmd')
    autocmd FileType python set expandtab
    autocmd! BufWritePost .vimrc nested source $MYVIMRC
endif

if &t_Co >= 256 || has("gui_running")
    set background=light
    colorscheme solarized
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
" """""""""""""""""
" open splits
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j
set splitbelow
set splitright
" movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <C-F9> :exe "resize +5"<CR>
nnoremap <silent> <C-F10> :exe "resize -5"<CR>
nnoremap <silent> <C-F11> :exe "vertical resize +5"<CR>
nnoremap <silent> <C-F12> :exe "vertical resize -5"<CR>

" make VIM command line movement behave like a modern command line
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

" copy what has been pasted
xnoremap p pgvy

" Quote words under cursor
nnoremap <leader>" viW<esc>a"<esc>gvo<esc>i"<esc>gvo<esc>3l
nnoremap <leader>' viW<esc>a'<esc>gvo<esc>i'<esc>gvo<esc>3l

" Quote current selection
" TODO: This only works for selections that are created 'forwardly'
vnoremap <leader>" <esc>a"<esc>gvo<esc>i"<esc>gvo<esc>ll
vnoremap <leader>' <esc>a'<esc>gvo<esc>i'<esc>gvo<esc>ll

" Region expand with vvv...
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" quick save
nnoremap <leader>w :w

" Search and replace: /searchpattern -> replace with 'cs replacement, ESC'
" -> go to next search result and replace with 'n.n.n.n.n....'
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" Ag
nnoremap <leader>a :Ag

" CtrlP performance boost
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" Use shift-H and shift-L for move to beginning/end
nnoremap H 0
nnoremap L $

" open file located next to current one in this buffer
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>ve :vs <C-R>=expand("%:p:h") . "/" <CR>

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
    setl updatetime=300
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
set gcr=a:blinkon0          " turn of the blinking cursor

" toggle bg for (solarized colorscheme)
nnoremap <leader>bg :call ToggleBackground()<cr>

let g:solarized = "/Users/lui/.solarized"
let g:is_light = eval(readfile(g:solarized)[0])
function! SetBackground(is_light)
    if a:is_light
        set background=light
        colorscheme solarized
        call writefile([1], g:solarized)

        " gitgutter colors
        highlight clear SignColumn
        highlight GitGutterAdd ctermfg=green guifg=darkgreen
        highlight GitGutterChange ctermfg=yellow guifg=darkyellow
        highlight GitGutterDelete ctermfg=red guifg=darkred
        highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow
    else
        set background=dark
        colorscheme zenburn
        call writefile([0], g:solarized)

        " gitgutter colors
        highlight clear SignColumn
    endif
endfunction
call SetBackground(g:is_light)

function! ToggleBackground()
    if g:is_light
        let g:is_light = 0
    else
        let g:is_light = 1
    endif
    call SetBackground(g:is_light)
endfunction

" Powerline setup
set guifont=Inconsolata-dz\ for\ Powerline:h12
set laststatus=2            " tell VIM to always put a status line in, even
                            "    if there is only one window

" Strip all trailing whitespace from a file, using ,W
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" C-U in insert/normal mode, to uppercase the word under cursor
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe

" Tagbar
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>to :TagbarOpen<CR>
nnoremap <leader>tf :TagbarTogglePause<CR>
let g:tagbar_autoclose = 1

" klen/python-mode
let g:pymode_lint_checker = "pep8,pyflakes"
let g:pymode_lint_mccabe_complexity = 20
let g:pymode_rope = 0
let g:pymode_lint_minheight = 8
let g:pymode_lint_maxheight = 10
let g:pymode_rope_goto_definition_cmd = 'vnew'
let g:pymode_lint_ignore = "C0110,F0401,W0403,E123,E124,E126"

" Python
if has('autocmd')
    autocmd BufRead *.py nmap <F4> oclass Dbg(object):<esc>oactive = False<esc>oDEBUGGER = Dbg()<esc>V<
    autocmd BufRead *.py nmap <F5> oif DEBUGGER.active:<esc>oimport pdb; pdb.set_trace()<esc>
    autocmd BufRead *.{txt,rst,py} nmap <F6> o>>> from ... import DEBUGGER<esc>o>>> DEBUGGER.active = True<esc>k0f.ve
    autocmd BufRead *.zcml set filetype=xml
endif

" JavaScript
if has('autocmd')
    autocmd FileType javascript call JavaScriptFold()
    autocmd FileType javascript set tabstop=2  " a tab is two spaces
    autocmd FileType javascript set softtabstop=2
    autocmd FileType javascript set shiftwidth=2
endif

" syntastic config (external linters)
let g:syntastic_javascript_checkers = ['eslint'] " requires 'npm -g install eslint'
let g:syntastic_json_checkers = ['jsonlint'] " requires npm install -g jsonlint
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" vim-json
let g:vim_json_syntax_conceal = 0

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

let NERDTreeShowLineNumbers=1

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
nnoremap <silent> <leader>mc /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>
" }}}


