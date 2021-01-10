"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc
"
let g:config_file_list = ['settings.vim',
  \ 'filetypes.vim',
  \ 'plugin_config/fzf.vim',
  \ 'plugin_config/ctags.vim',
  \ 'plugin_config/netrw.vim',
  \ 'plugin_config/vimwiki.vim',
  \ 'mappings.vim',
  \ 'plugins.vim',
  \ 'ui.vim'
  \ ]

let g:nvim_config_root = expand('<sfile>:p:h')
for s:fname in g:config_file_list
  execute printf('source %s/%s', g:nvim_config_root, s:fname)
endfor
