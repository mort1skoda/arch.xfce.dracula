""""""""""""""""""""""""""""""""""""""""
""""    ~/.vimrc    """"
""""""""""""""""""""""""

" Author: Morten Håkestad <mort1skoda@gmail.com>
echom"in /home/m/.vimrc"

"--- folds -------------------{{{
setlocal foldmethod=marker
" ff = toogle one folder
nnoremap ff za
" fc = folder close all
nnoremap fc zm
" fo = folder open all
nnoremap fo zr
"-----------------------------}}}

" - SETTINGS -----------------------------------------------------{{{

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap
"set wrap
"set textwidth=80
"set spell spelllang=en_us
"Turn off spell
set nospell

setlocal foldmethod=marker

" when using ,v  the new pane will be on the right side.
" with respect to the pane you give the command from.
set splitright

" Expand aliases.
let $BASH_ENV = "~/.aliases.sh"

" Block cursor in Normal mode, vertical cursor in Insert mode,
" horizontal cursor in Replace mode
let &t_EI = "\<Esc>[1 q"
let &t_SR = "\<Esc>[3 q"
let &t_SI = "\<Esc>[5 q"

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible
" Do not create .swp files
set noswapfile
" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on
" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load and indent file for the detected file type.
filetype indent on
" Turn syntax highlighting on.
syntax on
" Add numbers to each line on the left-hand side.
set number
" turn relative line numbers on
set relativenumber
" Highlight cursor line underneath the cursor horizontally.
set cursorline
" Highlight cursor line underneath the cursor vertically.
set cursorcolumn
" Set the color scheme.
colorscheme molokai
" Set shift width to 4 spaces.
set shiftwidth=4
" Set tab width to 4 columns.
set tabstop=4
" Use space characters instead of tabs.
set expandtab
" Do not save backup files.
set nobackup
" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=16
" Incrementally highlight matching characters as you type.
set incsearch
" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are on the last line.
set showmode
" Show matching words during a search.
set showmatch
" Use highlighting when doing a search.
set hlsearch
" Set the commands to save in history default number is 20.
set history=1000
" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" --- MAPPINGS ---------------------------------------------------------{{{

" from Normal mode you can type q followed by enter to quit without saving
nnoremap q :q
" ctrl-q write and quit
" in normal, insert, visual and command mode.
nnoremap <c-q> :wq
inoremap <c-q> <ESC>:wq
vnoremap <c-q> <ESC>:wq
cnoremap <c-q> <ESC>:wq

" toggle fold
nnoremap ff za

" å = go to end of line, 0=go to beginning of line.
nnoremap å $:echo'å=go to end of line'<CR>
nnoremap 0 0:echo'0=go to beginning of line'<CR>

nnoremap h h:echo'-- NORMAL --   h-left'<CR>
nnoremap j j:echo'-- NORMAL --   j-dwn'<CR>
nnoremap k k:echo'-- NORMAL --   k-up'<CR>
nnoremap l l:echo'-- NORMAL --   l-right'<CR>

" speed up scrolling
nnoremap <C-e> 4<C-e>:echo 'scroll dwn'<CR>
nnoremap <C-y> 4<C-y>:echo 'scroll up'<CR>


"- panes -------------------------------------{{{
"
let mapleader = ","
"
" ,vv for vertical split ,hh for horizonal split
nnoremap <Leader>v :vs<CR>: source ~/.vimrc<CR>
nnoremap <Leader>h :sp<CR>: source ~/.vimrc<cr>
" ctrl-hjkl navigate panes
nnoremap <C-l> <C-w>l:echo 'nav pane right:' expand('%:p')<CR>
nnoremap <C-h> <C-w>h:echo 'nav pane left:' expand('%:p')<CR>
nnoremap <C-j> <C-w>j:echo 'nav pane dwn:' expand('%:p')<CR>
nnoremap <C-k> <C-w>k:echo 'nav pane up:' expand('%:p')<CR>
" Resize panes: SHIFT-L and SHIFT-H
nnoremap <S-L> 2<c-w><:echo 'Resize pane SHIFT-L=>'<CR>
nnoremap <S-H> 2<c-w>>:echo 'Resize pane SHIFT-H=<'<CR>
nnoremap <S-J> <c-w>+:echo 'Resize pane SHIFT-J=dwn'<CR>
nnoremap <S-K> <c-w>-:echo 'Resize pane SHIFT-K=up'<CR>
"
" move cursor in insert mode with shift hjkl
"inoremap <S-L> <ESC>lli
"inoremap <S-H> <ESC>i
"inoremap <S-J> <ESC>jli
"inoremap <S-K> <ESC>kli
"
"---------------------------------------------}}}


"-------- C COMPILATION using Makefile ---------
" F2 F3 ...
nnoremap <F2> :!make help<CR>
nnoremap <F3> :!make vars<CR>
nnoremap <F4> :!make clean<CR>
nnoremap <F5> :!make<CR>
nnoremap <F6> :!make run<CR>
nnoremap <F7> :!make dbg<CR>
" ,mh ,mv ...
"""" Please see MAPLEADER fold.
"nnoremap <Leader>mh :!make help<CR>
"nnoremap <Leader>mv :!make vars<CR>
"nnoremap <Leader>mc :!make clean<CR>
"nnoremap <Leader>mm :!make<CR>
"nnoremap <Leader>mr :!make run<CR>
"nnoremap <Leader>md :!make dbg<CR>
"-----------------------------------------------

"""" Please see MAPLEADER fold.
"nnoremap <Leader>va :vs $ALIASES<CR>:echo expand('%:p')<CR>
"nnoremap <Leader>vb :vs $BASHRC <CR>:echo expand('%:p')<CR>
"nnoremap <Leader>vf :vs $VIFMRC <CR>:echo expand('%:p')<CR>
"nnoremap <Leader>vt :vs $TMUX   <CR>:echo expand('%:p')<CR>
"nnoremap <Leader>vv :vs $VIMRC  <CR>:echo expand('%:p')<CR>


" ctrl-s write (save) and source ~/.vimrc
" in normal, insert, visual and comand mode.
nnoremap <C-s> :w<CR>:source $VIMRC<CR>:echo'ctrl-s save'$VIMRC ' sourced:'$VIMRC<CR>
" NB!!! ::: Do NOT remove the l after <CR> ::: !!!
" It adjusts the position of the coursor!!
inoremap <C-s> <ESC>:w<CR>l:source $VIMRC<CR>:echo'Insert->Normal C-s = Save.  Saved:'expand('%:p')' sourced:'$VIMRC<CR>
vnoremap <C-s> <ESC>:w<CR>:source $VIMRC<CR>:echo'Visual->Normal C-s = Save.  Saved:'expand('%:p')' sourced:'$VIMRC<CR>
"cnoremap <C-s> <ESC>:w<CR>:source $VIMRC<CR>:echo'Change->Normal C-s = Save.  Saved:'expand('%:p')' sourced:'$VIMRC<CR>






nnoremap u u:echo'Normal u = undo last change'<cr>

" U: Undo latest changes to one line. This command is unique because it will
" create a new entry instead of reverting back to an old entry. This means you
" can actually press u to undo the changes done with U.


nnoremap o o<esc>:echo'Normal o = Open line below'<cr>
nnoremap O O<esc>:echo'Normal O = Open line abowe'<cr>

" Y,D,C = Yank, Delete, Change from cursor to the end of line.
nnoremap Y  y$:echo'Normal  Y=Yank from cursor to end of line'<CR>
nnoremap yw yw:echo'Normal yw=yank word'<cr>
nnoremap yy yy:echo'Normal yy=yank the whole line'<cr>
nnoremap yt yt
nnoremap yf yf
"NB! yt and yf can not have an echo statment after them.

nnoremap D  d$:echo'Normal  D=Delete from cursor to end of line'<cr>
nnoremap dw dw:echo'Normal dw=delete word'<cr>
nnoremap dd dd:echo'Normal dd=delete line'<cr>
nnoremap df df
nnoremap dt dt
"NB! dt and df can not have an echo statment after them.

" make cw behave like dw and yw
"nnoremap cw dwi

nnoremap C c$
":echo'C = change from cursor to end of line'<cr>

" P = Paste, used after yank or delete 
nnoremap P P:echo'P = Paste line abowe / Paste token at cursor'<cr>
nnoremap p p:echo'p = paste line below / paste token after cursor'<cr>

" Shift-x insert space, only x delete one character.
nnoremap X i<space><esc>:echo'Normal X=insert space'<esc>
nnoremap x x:echo'Normal x=delete one char.'<esc>

"h jh   kj  k

" Space to type :!  to enter shell comands.
nnoremap <SPACE> :!
"inoremap <TAB> <SPACE><SPACE><SPACE><SPACE>
nnoremap <TAB> :
    
" ctrl-x to search and replace.
nnoremap <C-x> :%s/
" ctrl-f find
nnoremap <C-f> /


"-------------------------- ESC mapping ------------------------------------
"nnoremap <esc> <esc>:echo'Normal -> Normal esc = back to normal mode'<cr>
inoremap <esc> <esc>l:echo'Insert -> Normal esc = back to normal mode'<cr>
"vnoremap <esc> <esc>:echo'Visual -> Normal esc = back to normal mode'<cr>'
"cnoremap <esc> <esc>:echo'Command -> Normal esc = back to normal mode'<cr>'

"------------------------------------ end mappings ---------------------------}}}

" ----- , mapleader MACROS -----------------{{{


" ,va ,vb ... edit dotfiles
let $ALIASES = '~/.aliases.sh'
let $BASHRC  = '~/.bashrc'
let $VIFMRC  = '~/.vifm/vifmrc.vim' 
let $TMUX    = '~/.tmux.conf'
let $VIMRC   = '~/.vimrc'

setlocal foldmethod=marker
nnoremap <Leader>ea :vs $ALIASES<CR>:setlocal foldmethod=marker<CR>:echo expand('%:p')<CR>
nnoremap <Leader>eb :vs $BASHRC <CR>:setlocal foldmethod=marker<CR>:echo expand('%:p')<CR>
nnoremap <Leader>ef :vs $VIFMRC <CR>:setlocal foldmethod=marker<CR>:echo expand('%:p')<CR>
nnoremap <Leader>et :vs $TMUX   <CR>:setlocal foldmethod=marker<CR>:echo expand('%:p')<CR>
nnoremap <Leader>ev :vs $VIMRC  <CR>:setlocal foldmethod=marker<CR>:echo expand('%:p')<CR>

" ,mh ,mv ...
nnoremap <Leader>mh :!make help<CR>
nnoremap <Leader>mv :!make vars<CR>
nnoremap <Leader>mc :!make clean<CR>
nnoremap <Leader>mm :!make all<CR>
nnoremap <Leader>mr :!make run<CR>
nnoremap <Leader>md :!make dbg<CR>


" open vim integrated file explorer
nnoremap <Leader>ex :Lexplore<CR>7<C-w><

" ,ch = leader comment hash
nnoremap <Leader>ch I#<ESC>j
" ,ca = leader comment apostrophe
nnoremap <Leader>ca I"<ESC>j
" ,cc = leader comment c source code
nnoremap <Leader>cc I//<ESC>j

" }}}

" ------- @ MACROS -----------------{{{

" @c comment C line
let @c="I// \<Esc>j"

" @u uncomment C line
let @u = "I\<Del>\<Del>\<Del>\<Esc>j"

" @p printf("
let @p = "Iprintf(\""

" @f for(int i = 0; i < 10; i++){
let @f = "I\<TAB>for(int i = 0; i < 10; i++){\<esc>I\<tab>\<tab>"

"-------------------------------------------}}}

" --------- SCRIPTS ------------------------------------------------------{{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
	autocmd!
	autocmd WinLeave * set nocursorline nocursorcolumn
	autocmd WinEnter * set cursorline cursorcolumn
augroup END


" }}}

"--- plugins ---{{{

"call plug#begin('~/.vim/plugged')


"call plug#end()

"---------------}}}

"--- statusline ---{{{
set laststatus=3
set statusline=
set statusline+=%F
set statusline+=%=
set statusline+=row:%l\ col:%c\ percent:%p%%
"------------------}}}

