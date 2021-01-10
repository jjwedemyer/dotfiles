" buffer switching
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>

nnoremap <Leader>g :GoyoToggle<CR>
" Shift indentation in visual mode
vmap > >gv
vmap < <gv

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
