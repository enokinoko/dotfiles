set number
set title
set showmatch
set expandtab
set tabstop=4
set shiftwidth=4
set cindent
inoremap <silent> jj <ESC>
set hlsearch
set clipboard=unnamedplus
set showcmd
set wrap

" 開いているpython scriptをvim内から実行
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %

"color scheme
set t_Co=256
colorscheme desert
"colorscheme kalisi
"colorscheme tender
"set background=dark

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

"dein.vim setting
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

    " 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/neocomplete.vim')
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/neomru.vim')
    call dein#add('davidhalter/jedi-vim', {'on_ft' : 'python'})
    call dein#add('nathanaelkane/vim-indent-guides')
    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
    call dein#install()
endif

"参照：http://chakku.hatenablog.com/entry/2016/02/08/234128
if &term =~ '256color'
    set t_ut=
endif

syntax on
