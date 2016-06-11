set number
set title
set showmatch
syntax on
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
inoremap <silent> jj <ESC>
set hlsearch
set clipboard=unnamedplus
set showcmd
"-----
"Start Neobudle Settings.
"-----
"bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
"Required
call neobundle#begin(expand('~/.vim/bundle/'))
"neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
"ここから追加のプラグインを
"
NeoBundle 'Shougo/unite.vim'
"unite {{{
"let g:unite_enable_start_insert=1
"nmap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
"nmap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"nmap <silent> <C-u><C-r> :<C-u>Unite -buffer-name=register register<CR>
"nmap <silent> <C-u><C-m> :<C-u>Unite file_mru<CR>
"nmap <silent> <C-u><C-u> :<C-u>Unite buffer file_mru<CR>
"nmap <silent> <C-u><C-a> :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"au FileType unite imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"au FileType unite imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"au FileType unite nmap <silent> <buffer> <ESC><ESC> q
"au FileType unite imap <silent> <buffer> <ESC><ESC> <ESC>q
" }}}
"
NeoBundle 'Shougo/neomru.vim', {
  \ 'depends' : 'Shougo/unite.vim'
  \ }

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
      \ 'depends' : 'Shougo/vimproc',
      \ 'autoload' : { 'insert' : 1,}
      \ }
  endif

 "neocomplete {{{
 let g:neocomplete#enable_at_startup               = 1
 let g:neocomplete#auto_completion_start_length    = 3
 let g:neocomplete#enable_ignore_case              = 1
 let g:neocomplete#enable_smart_case               = 1
 let g:neocomplete#enable_camel_case               = 1
 let g:neocomplete#use_vimproc                     = 1
 let g:neocomplete#sources#buffer#cache_limit_size = 1000000
 let g:neocomplete#sources#tags#cache_limit_size   = 30000000
 let g:neocomplete#enable_fuzzy_completion         = 1
 let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
 " }}}

NeoBundleLazy 'Shougo/vimshell', {
  \ 'depends' : 'Shougo/vimproc',
  \ 'autoload' : {
  \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
  \                 'VimShellExecute', 'VimShellInteractive',
  \                 'VimShellTerminal', 'VimShellPop'],
  \   'mappings' : ['<Plug>(vimshell_switch)']
  \ }}

" vimshell {{{
nmap <silent> vs :<C-u>VimShell<CR>
nmap <silent> vp :<C-u>VimShellPop<CR>
" }}}

"ここまで
call neobundle#end()
"Required
filetype plugin indent on
"未インストールのプラグインがある場合，インストールの是非を問う
"毎回聞かれるので注意
NeoBundleCheck
"-----
"End Neobundle Settings.
"-----
"vimshell map
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vp :VimShellPop<CR>
