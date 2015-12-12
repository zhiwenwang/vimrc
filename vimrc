set shell=/bin/bash
" Vundle
set nocompatible 	"no compatible with vi mode"
set shiftwidth=4	"縮排寬度=4"
set ts=4            "tab佔四個空白鍵"
set sts=4           "tab改為四個空白鍵,刪除時同樣刪除四個空白鍵"
set expandtab       "tab改為space"
set incsearch       "搜尋時提示目前輸入的字"
set hlsearch        "提示搜尋結果"
set cursorline      "底線標註"
set smartindent     "Enter下一行和原先所在相同縮排,但#和某些符號例外"
set number
syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/Vundel.vim')


Plugin 'VundleVim/Vundle.vim' " Plugin 'gmarik/Vundle.vim'


Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
"Plugin 'Raimondi/delimitMate'
Plugin 'jiangmiao/auto-pairs'
Plugin 'SirVer/ultisnips'
"c9s大大的註解: normal_mode ",+c"=>註解, ",+C"=>取消註解, ",,"=>line comment"
Plugin 'c9s/simple-commenter.vim'
"html emmet 自動補全包含html.erb, insert_mode <c-e> 啟用, insert_mod
"<c-n>跳至下一個empty_tag 
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

call vundle#end()
filetype plugin indent on

" set status line
set laststatus=2
" enable powerline-fonts
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#buffer_nr_format='%s: '

" set delimitMate setting
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" set nerdtree
let g:NERDTreeWinSize = 20
map <Leader>] <plug>NERDTreeTabsToggle<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="ii"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let g:scomment_default_mapping = 1


"insert_mode S+Tab將游標移至最後"
:inoremap <S-tab> <ESC> A
