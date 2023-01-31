#----------------------------------------------------------
#---      ~/.bash_aliases      ----
#----------------------------------


#--- header ------------------------------------------------{{{
# Author: Morten Håkestad
#
# This script file is source by .bashrc
#
# Use ff or za to toggle folds.
# Use ag to grep for aliases.
# Use cag to grep for everything in this file. 
# Example:
# ag vim    will list all aliases that contains 'vim'
# cag vim   will list all accourences of 'vim' in this file.

echo -e "---|---|....start" $ALIASES "....|---|---"
#-----------------------------------------------------------}}}


#--- bash --------------------------------------------------{{{
# start programs:
alias bl='bash --login'
alias bt="bashtop"
alias f='vifm /home/m /home/m/repos'
alias x='startx'
alias a='alias' #list all aliases
alias s='sudo'
alias gv='gvim '
# clear screen:
alias cs='clear'
alias nf="clear && neofetch"

# change directory:
alias ..='cd .. && ls -la --color --group-directories-first'
alias ...='cd ../.. && ls -la --color --group-directories-first'
alias .r='cd / && ls -la --color --group-directories-first'
alias .h='cd ~ && ls -la --color --group-directories-first'
alias .d='cd /dat && ls -la --color --group-directories-first'

# windows C:\ and D:\
alias .wc='cd /mnt/c && ls -la --color --group-directories-first'
alias .wd='cd /mnt/d && ls -la --color --group-directories-first'

# list directories:
alias l='ls -la --color --group-directories-first'
alias ll='ls -l --color --group-directories-first'
alias ls='ls --color --group-directories-first'
alias lg='ls -la --color --group-directories-first | grep -i --color '
alias md='mkdir -p'
alias rd='rmdir -p'
alias wl='watch --color ls -la --color --group-directories-first'

# cat aliases then grep for <token>
alias ag='alias | grep -i --color '
alias cag='source ~/.aliases.sh && cat ~/.aliases.sh | grep -i --color '

# su  =  su root  by default in bash. 

# shortcuts:
alias c='cat'
alias g='grep --color=auto'
alias hg='cat .bash_history | grep -i '
alias os='cat /etc/os-release'
alias wa='whoami'

# vim edit resources:
alias ,='vim'
alias ,a='vim ~/.bash_aliases && source ~/.bash_profile'
alias ,b='vim ~/.bashrc && source ~/.bashrc'
alias ,f='vim ~/.vifm/vifmrc.vim'
alias ,p='vim ~/.profile'
alias ,v='vim ~/.vimrc'

# source profile, bashrc, aliases 
alias sp='source ~/.bash_profile'
alias sb='source ~/.bashrc'
alias sa='source ~/.bash_aliases'

# package managers:
alias sai='sudo apt install '
alias sau='sudo apt update -y && sudo apt upgrade -y && autoremove'
alias pu='sudo pacman -Syyu'
alias pi='sudo pacman -S '
alias rb='sudo reboot'
alias sd="sudo shutdown -h now"

# filesystem:
alias lbl="lsblk -o NAME,MODEL,PARTTYPENAME,FSTYPE,SIZE,MOUNTPOINTS,SERIAL"
alias cp="cp -iv"


# quit or exit shell.  same as quiting vim (whitout save)
alias q='exit'

#-----------------------------------------------------------}}}


#--- git ---------------------------------------------------{{{
DATE=$(date +"[%Y-%m-%d %H:%M:%S]")
#echo $DATE  
alias gs='git status'
alias gr='git remote -v'
alias gc='git commit -m "$DATE"'
alias ga='git add'
alias gaa='git add --all'
alias gp='git push'
# mapleader = , here , is vim 
alias ,gi='vim .gitignore'
alias ,gc='vim ~/.gitconfig'
#-----------------------------------------------------------}}}


#--- tmux --------------------------------------------------{{{
# tm = tmux, start a new tmux session
alias tm='tmux'
# tl = tmux list
alias tl='tmux ls'
# ta=tmux attach -t [enter session-name from tl]
alias ta='tmux a -t '
# ,et = edit .tmux.conf
alias ,t='vim ~/.tmux.conf'

alias ts='./tmux.session.sh save'
alias tr="./tmux.session.sh restore"
#-----------------------------------------------------------}}}


#--- network -----------------------------------------------{{{
alias ip="ip -color=auto"
#-----------------------------------------------------------}}}


#--- make --------------------------------------------------{{{
alias ,mh='make help'
alias ,mv='make vars'
alias ,mc='make clean'
alias ,mm='make all'
alias ,mr='make run'
alias ,md='make dbg'
#-----------------------------------------------------------}}}


#--- debug ------------------------------------------------{{{
alias keycodes="sed -n l"
alias dbgvim="vim -V20 2>&1 | tee vim.logfile.txt.vim && vim vim.logfile.txt.vim"

#
#----------------------------------------------------------}}}


#--- footer ------------------------------------------------{{{
shopt -s expand_aliases
#source .bash_aliases
echo    "                Sourced:" $ALIASES 
echo -e "---|---|....end.." $ALIASES "....|---|---"
#-----------------------------------------------------------}}}


