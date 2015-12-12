set shell=/bin/bash
" Vundle
set nocompatible 	"no compatible with vi mode"
set shiftwidth=4	"縮排寬度=4"
set tabstop=4
set expandtab
set ru
set incsearch
set smartindent
syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/Vundel.vim')


" Plugin 'VundleVim/Vundle.vim'

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
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
Plugin 'c9s/simple-commenter.vim'

call vundle#end()
filetype plugin indent on

" set status line
set laststatus=2
" " enable powerline-fonts
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#buffer_nr_format='%s: '

"set delimitMate setting
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

"ultisnips
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
set number

:inoremap <S-tab> <ESC> A
