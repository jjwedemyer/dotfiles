autocmd BufEnter * :syntax sync fromstart
au BufRead,BufNewFile *.md setlocal textwidth=80

" keeping this for reference, this can retag filetypes to another
"autocmd BufNewFile,BufRead *.twig set filetype=html
