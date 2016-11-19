set encoding=utf-8
scriptencoding utf-8

"-----------------------------------------------------
"文字コードについて

set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

"-----------------------------------------------------
"タブインデント

set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set shiftwidth=4

"------------------------------------------------------
"文字検索
set incsearch
set ignorecase
set smartcase
set hlsearch

nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"------------------------------------------------------
"カーソル

set whichwrap=b,s,h,l,<,>,[,],~
set number
set cursorline

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set backspace=indent,eol,start

"-----------------------------------------------------
"カッコタブジャンプ

set showmatch
source $VIMRUNTIME/macros/matchit.vim

"------------------------------------------------------
"コマンド補完

set wildmenu
set history=5000

"-----------------------------------------------------
"マウスの移動

if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

"------------------------------------------------------
"ペースト設定

if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPastBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif


"------------------------------------------------------
"
if &compatible
	set nocompatible
endif

set runtimepath+=~/.catch/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.catch/dein'))

if !isdirectory('~/.catch/dein')
	call mkdir('~/.catch/dein', 'p')
silent execute printf('git clone %s %s', 'https://github.com/Shougo/dein.vim', '~/.catch/dein')
endif 

call dein#add('Shougo/dein.vim')

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')

call dein#add('Shougo/unite.vim')
call dein#add('ujihisa/unite-colorscheme')

call dein#add('tomasr/molokai')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('Yggdroot/indentLine')

call dein#add('scrooloose/syntastic')

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif

"------------------------------------------------------
"syntacsの設定

let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['javascript'],
                           \ 'passive_filetypes': [] }
colorscheme molokai
set t_Co=256

syntax on
