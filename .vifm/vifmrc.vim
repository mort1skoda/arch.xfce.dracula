""""""""""""""""""""""""""""""""""""""""
""""    ~/.vifm/vifmrc.vim    """"
""""""""""""""""""""""""""""""""""

" ff = toggle folds

"""""""""""  SETTINGS  """""""""""{{{

colorscheme molokai

" make it posible for aliases to function within vifm :!m r
let $BASH_ENV = "~/.aliases.sh"
set syscalls

" show hidden files by default
windo normal! zo
" not suported:  let mapleader ","

set confirm-=delete

"}}}


"- mappings -------------------------------------------------------{{{

" Try to make them as close to vim as possible:

" <space> = :! = run external shell command
nnoremap <space> :!

" <TAB> = command mode
nnoremap <TAB> :

" ctrl-q = quit
nnoremap <C-q> :q
nnoremap q :q


" ctrl-s = source ~/.vifm/vifmrc 
nnoremap <C-s> <ESC>:source ~/.vifm/vifmrc<CR>
cnoremap <C-s> <ESC>:source ~/.vifm/vifmrc<CR>

" ctrl-h,l and TAB toggle panes
nnoremap <C-l> <C-w><C-w>
nnoremap <C-h> <C-w><C-w>

"ctrl-w v = split vertical 
"ctrl-w s = split horizontal
"ctrl-w o = one pane only
"------------------------------------------------------------------}}}


" ////////////// RENAMING //////////////////{{{

" i = insert / rename from start of filename
nnoremap i cw<C-a>

" a = append / rename from end   of filename
nnoremap a cw

" c = change / rename the whole filename.
nnoremap c cw<C-u>

"}}}


