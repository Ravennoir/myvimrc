set nocompatible              " be iMproved, required
set enc=utf-8                 " use utf-8 as default encoding 
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Nerdtree filebrowser
Plugin 'scrooloose/nerdtree'

" Multicursor 
Plugin 'terryma/vim-multiple-cursors'

" Ack, better grep
Plugin 'mileszs/ack.vim'

" Markdown Preview
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Colorscheme
" http://cocopon.me/app/vim-color-gallery/
Plugin 'sjl/badwolf'
Plugin 'altercation/vim-colors-solarized'

" Python autocompletion
"Plugin 'rkulla/pydiction'
"let g:pydiction_location = '/Users/bjorn/.vim/bundle/pydiction/complete-dict'

" Python autocompletion
Plugin 'davidhalter/jedi-vim'

" Fuzzyfilesearch
Plugin 'kien/ctrlp.vim'

" PEP8
Plugin 'nvie/vim-flake8'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.

" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" vim-airline integration
Plugin 'bling/vim-airline'
"Plugin 'lokaltog/powerline-fonts'

" Autopairing of brackets etc
Plugin 'jiangmiao/auto-pairs'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1


" flake8 Check on each write
autocmd BufWritePost *.py call Flake8()

" Disable autocomment addition in next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" This shows what you are typing as a command.  I love this!
set showcmd

" Folding Stuffs
set foldmethod=marker

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=4
set softtabstop=4

" Got backspace?
set backspace=2

" Line Numbers PWN!
set number

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" This is totally awesome - remap jj to escape in insert mode.  
" You'll never type jj anyway, so it's great!
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" Favorite Color Scheme
colorscheme badwolf
" Remove Toolbar
"set guioptions-=T
"Terminus is AWESOME
"set guifont=Terminus\ 9

" Better command-line completion
set wildmenu

" enable mouse
set mouse=a

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Makes search act like search in modern browsers
set incsearch

" Set to auto read when a file is changed from the outside
set autoread

" Sets how many lines of history VIM has to remember
set history=700

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,mac,dos

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Bind <Leader> to ,
let mapleader=","

let g:ackprg = 'ag --nogroup --nocolor --column'

" Save file with sudo
noremap <Leader>W :w !sudo tee % > /dev/null

" Remember info about open buffers on close
set viminfo^=%

" Always show the status line
set laststatus=2

" kset lazyredraw " do not redraw while running macros

set list " we do what to show tabs, to ensure we get them out of my files
set listchars=tab:>-,trail:- " show tabs and trailing
set numberwidth=5 " We are good up to 99999 lines
set ruler " Always show current positions along the bottom
set scrolloff=10 " Keep 10 lines (top/bottom) for scope
set sidescrolloff=10 " Keep 5 lines at the size
"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

function! s:setupMarkup()
  nnoremap <leader>p :silent !open -a Marked2.app '%:p'<cr>
endfunction

au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
