set shell=/bin/bash
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set nocompatible 	" no compatible with vi mode"
set shiftwidth=4	" 縮排寬度=4"
set ts=4            " tab佔四個空白鍵"
set sts=4           " tab改為四個空白鍵,刪除時同樣刪除四個空白鍵"
set expandtab       " tab改為space"
set incsearch       " 搜尋時提示目前輸入的字"
set hlsearch        " 提示搜尋結果"
set cursorline      " 底線標註"
set smartindent     " Enter下一行和原先所在相同縮排,但#和某些符號例外"
set textwidth=78
set number
set mouse=nv
set t_Co=256
"insert_mode S-tab將游標移至最後"
:inoremap <C-l> <ESC> A
syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/Vundel.vim')


" Vundle
Plugin 'VundleVim/Vundle.vim' " Plugin 'gmarik/Vundle.vim'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'w0ng/vim-hybrid'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'honza/vim-snippets'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'SirVer/ultisnips'
"c9s大大的註解: normal_mode ",+c"=>註解, ",+C"=>取消註解, ",,"=>line comment"
Plugin 'c9s/simple-commenter.vim'
"html emmet 自動補全包含html.erb, insert_mode <c-e> 啟用, insert_mode
"<c-n>跳至下一個empty_tag 
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"<c-p>搜尋檔案
Plugin 'ctrlpvim/ctrlp.vim'
"自動補全...
Plugin 'Valloric/YouCompleteMe'
Plugin 'taglist.vim'
Plugin 'jlanzarotta/bufexplorer'

call vundle#end()
filetype plugin indent on

"Use theme
set background=dark
colorscheme dracula
" move up/down quickly by using leader-j, leader-k
" which will move us around by functions
nnoremap <silent> <Leader>j }
nnoremap <silent> <Leader>k {
autocmd FileType ruby map <buffer> <Leader>j ]m
autocmd FileType ruby map <buffer> <Leader>k [m
autocmd FileType rspec map <buffer> <Leader>j }
autocmd FileType rspec map <buffer> <Leader>k {
autocmd FileType javascript map <buffer> <Leader>k }

" set status line
set laststatus=2
" enable powerline-fonts
let g:airline_theme='murmur'
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
nnoremap <silent> \z :bp!<CR>
nnoremap <silent> \x :bn!<CR>
nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical<CR>

" \q to toggle quickfix window (where you have stuff like Ag)" ultisnips
" \oq to open it back up (rare)                              
nmap <silent> \qc :cclose<CR>
nmap <silent> \qo :copen<CR>

let g:UltiSnipsExpandTrigger="ii"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
" Configuration file for vim
set modelines=0		" CVE-2007-2438


" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

"simple_commenter"
let g:scomment_default_mapping = 1

"YCM
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_confirm_extra_conf =0
let g:ycm_filetype_blacklist = { 'gitcommit':1 }
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
" let g:EclimCompletionMethod = 'omnifunc'
" if has("autocmd")
"     autocmd FileType ruby, eruby set omnifunc=rubycomplete#Complete
"     autocmd FileType ruby, eruby let g:rubycomplete_buffer_loading=1
"     autocmd FileType ruby, eruby let g:rubycomplete_classes_in_global=1
" endif

nnoremap \vv :Eview<cr>
nnoremap \cc :Econtroller<cr>


"在.erb下按＝,- 啟用surround
autocmd FileType erb let b:surround_{char2nr('=')} = "<%= \r %>"
autocmd FileType erb let b:surround_{char2nr('-')} = "<% \r %>"
" \# Surround a word with #{ruby interpolation}
map \# ysiw#
vmap \# c#{<C-R>"}<ESC>"}

" \" Surround a word with "quotes"
map \" ysiw"
vmap \" c"<C-R>""<ESC>

" \' Surround a word with 'single quotes'
map \' ysiw'
vmap \' c'<C-R>"'<ESC>

" \) or \( Surround a word with (parens)
" The difference is in whether a space is put in
map \( ysiw(
map \) ysiw)
vmap \( c( <C-R>" )<ESC>
vmap \) c(<C-R>")<ESC>

" \[ Surround a word with [brackets]
map \] ysiw]
map \[ ysiw[
vmap \[ c[ <C-R>" ]<ESC>
vmap \] c[<C-R>"]<ESC>

" \{ Surround a word with {braces}
map \} ysiw}
map \{ ysiw{
vmap \} c{ <C-R>" }<ESC>
vmap \{ c{<C-R>"}<ESC>

map \` ysiw`

"F3紀錄tag
nnoremap <F3> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


"F2開啟taglist
nnoremap <silent> <F2> :Tlist <CR>

"開啟時回復上次關閉的位置
if has("autocmd")
    au BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif
imap <silent> <D-k> _



