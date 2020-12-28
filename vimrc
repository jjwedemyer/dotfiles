scriptencoding utf-8
set encoding=utf-8

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
set ignorecase
set smartcase
set relativenumber
set number
set list
set listchars=tab:\_\_,eol:¬,trail:·
set noswapfile
set wildmenu
set wildmode=list:full
set scrolloff=5
set smarttab
set incsearch
set autoread
set cursorline
set showmatch
set hlsearch
set laststatus=0
"set statusline+=%=
"set statusline+=%{SyntasticStatuslineFlag()}
set mouse-=a
set backspace=indent,eol,start
" Give more space for displaying messages.
set cmdheight=2

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

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" LSP Client for nvim
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" find fuzzy faaaaaaaast
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Git things
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'
" Code Script setting
Plug 'godlygeek/tabular'
Plug 'valloric/MatchTagAlways'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot' " wrapper pkg for many (5xx) languages plugins
" Ctags
Plug 'preservim/tagbar'
Plug 'lvht/tagbar-markdown'
" Vimwiki and Components
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
" Style plugins
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
" Utilities
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
call plug#end()

if has("nvim")
	set termguicolors
else
	set nocompatible
	set ttyfast
endif

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=4
let g:syntastic_check_on_wq=0
let g:syntastic_check_on_open=1
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=3
let g:netrw_winsize=25
let g:netrw_use_errorwindow=0
let g:netrw_list_hide='^\.git/$'
let FZF_DEFAULT_COMMAND="fd --type file --follow --hidden"

let g:airline_powerline_fonts = 1
colorscheme gruvbox
set background=dark
set t_Co=256 " fixing tmux bold font

filetype plugin on
"filetype plugin indent off

let mapleader=","

" buffer switching
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>
" fzf keybinds
nnoremap <C-b> :Buffers<CR>
nnoremap <C-p> :Files .<CR>
nnoremap <Leader><space> :Rg<CR>
nnoremap <Leader><M-Space> :GFiles<CR>
nnoremap q: :History:<CR>

nmap <Leader>h <C-W>5|
nmap <Leader>l <C-W>|
nmap <Leader>j <C-W>5_
nmap <Leader>k <C-W>_

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <Leader>T :lua require'lsp_extensions'.inlay_hints()

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').help_tags()<cr>


if has("autocmd")
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	autocmd BufNewFile,BufRead *.twig set filetype=html
	autocmd BufEnter * :syntax sync fromstart
  au BufRead,BufNewFile *.md setlocal textwidth=80
endif

function! StripTrailingWhitespaces()
	let _s=@/
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

lua require'nvim_lsp'.jdtls.setup{on_attach=require'completion'.on_attach}
lua require'nvim_lsp'.jsonls.setup{on_attach=require'completion'.on_attach}
lua require'nvim_lsp'.tsserver.setup{on_attach=require'completion'.on_attach}
lua require'nvim_lsp'.rls.setup{on_attach=require'completion'.on_attach}

let g:vimwiki_list = [{'path': '~/Documents/private_notes',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_dir_link = 'index'

let g:tagbar_type_vimwiki = {
          \   'ctagstype':'vimwiki'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin':'/Users/jakob/Code/priv/utils/vwtags.py'
          \ , 'ctagsargs': 'markdown'
          \ }

vmap > >gv
vmap < <gv

let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/path/to/your/universal/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }

let g:tagbar_type_bib = {
    \ 'ctagstype' : 'bib',
    \ 'kinds'     : [
        \ 'a:Articles',
        \ 'b:Books',
        \ 'L:Booklets',
        \ 'c:Conferences',
        \ 'B:Inbook',
        \ 'C:Incollection',
        \ 'P:Inproceedings',
        \ 'm:Manuals',
        \ 'T:Masterstheses',
        \ 'M:Misc',
        \ 't:Phdtheses',
        \ 'p:Proceedings',
        \ 'r:Techreports',
        \ 'u:Unpublished',
    \ ]
\ }
