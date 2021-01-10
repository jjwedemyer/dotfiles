" vimwiki settings
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
