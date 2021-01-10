" set encoding so it does not messup the display
scriptencoding utf-8
set encoding=utf-8

set iskeyword+=-            " treat dash separated words as a word text object
set hidden                  " switch between buffers with unwritten content

" tab stops and indentations
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
  " smarttab deletes/insert whatever shiftwidth is under the cursor
set smarttab
set backspace=indent,eol,start

set ignorecase
set smartcase
" Line numbering
set relativenumber
set number
" whitespace characters
set list
set listchars=tab:\_\_,eol:¬,trail:·
" do not write a swapfile when editing a file
set noswapfile
set wildmenu
set wildmode=list:full
set scrolloff=5

" incremental search
set incsearch
set showmatch
set hlsearch

" automatically reload the file again when changed by another process
set autoread
" display the cursor line highlighted
set cursorline

set laststatus=0
set mouse-=a
" Give more space for displaying messages.
set cmdheight=2

" set clipboard to pbcopy
set clipboard=unnamed

" show a vertical line after x characters
set colorcolumn=80

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

filetype plugin on
"filetype plugin indent off

let mapleader=","

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
