

"--- info --------------------------------------{{{
"--- ~/.vifm/vifmrc.vim
"--- Author: Morty Hawk
"--- email.: <mort1prog@outlook.com>
"
"--- ff = toggle folds
"--- fo = open all folds
"--- fc = close all folds
"------------------------------------------------}}}


"--- settings -----------------------------------------------{{{
"colorscheme molokai
"colorscheme Dracula
colorscheme Default-256

" make it posible for aliases to function within vifm :!m r
let $BASH_ENV = "~/.bash_aliases.sh"
set syscalls

" show hidden files by default
windo normal! zo

" ask user before deleting files or folders
set confirm-=delete
"------------------------------------------------------------}}}


"--- mappings ----------------------------------------------{{{

" Try to mimic vim close as possible:

" <space> = :! = run external shell command
" nnoremap <space> :!

" <TAB> = command mode
" nnoremap <TAB> :

" both q and ctrl-q to quit
nnoremap <C-q> :q
nnoremap q :q

" ctrl-s = source ~/.vifm/vifmrc 
nnoremap <C-s> <ESC>:source ~/.vifm/vifmrc<CR>
cnoremap <C-s> <ESC>:source ~/.vifm/vifmrc<CR>

" ctrl-h,l (and TAB) change panes
nnoremap <C-l> <C-w><C-w>
nnoremap <C-h> <C-w><C-w>

" info:
"ctrl-w v = split vertical 
"ctrl-w s = split horizontal
"ctrl-w o = one pane only
nnoremap <C-o> <C-w>o

"------------------------------------------------------------------}}}


" ////////////// RENAMING //////////////////{{{

" i = insert / rename from start of filename
nnoremap i cw<C-a>

" a = append / rename from end   of filename
nnoremap a cw

" c = change / rename the whole filename.
nnoremap c cw<C-u>

"}}}


