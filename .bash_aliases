############################################
####    /home/m/.aliases.sh    ####
###################################

#--- header --------------------------------------------------------{{{
# Author:    Morten Håkestad
#####
# This script file is source by .bashrc
#
# Use ff or za to toggle folds.
# Use ag to grep for aliases.
# Use cag to grep in this file.
# Example:
# ag vim    will list all aliases that contains 'vim'
# cag vim   will list all accourences of 'vim' in the whole file.

echo -e '        3... begin ' $ALIASES ' ............\n'
#-----------------------------------------------------------------}}}


#- aliases for bash --------------------------------------------------------{{{
# start programs
alias f='vifm /home/m  /01data'

# change directory:
alias ..='cd .. && ls -la --color --group-directories-first'
alias ...='cd ../.. && ls -la --color --group-directories-first'
alias .r='cd / && ls -la --color --group-directories-first'
alias .h='cd ~ && ls -la --color --group-directories-first'
alias .d='cd /dat && ls -la --color --group-directories-first'
# windows c:\
alias .wc='cd /mnt/c && ls -la --color --group-directories-first'
# windows d:\
alias .wd='cd /mnt/d && ls -la --color --group-directories-first'

# clear screen:
alias cs='clear'

# cat aliases then grep for <token>
alias ag='alias | grep -i --color '
alias cag='source ~/.aliases.sh && cat ~/.aliases.sh | grep -i --color '

# su  =  su root  by default in bash. 

# directories:
alias l='ls -la --color --group-directories-first'
alias ll='ls -l --color --group-directories-first'
alias ls='ls --color --group-directories-first'
alias lg='ls -la --color --group-directories-first | grep -i --color '
alias md='mkdir -p'
alias rd='rmdir -p'

alias bl='bash --login'

# shortcuts:
alias c='cat'
alias g='grep --color=auto'
alias hg='cat .bash_history | grep -i '
alias os='cat /etc/os-release'
alias wa='whoami'
alias rm='ls'
#Watch List Diretory:
alias wl='watch --color ls -la --color --group-directories-first'
#alias 
alias s='sudo'


# linux:
alias ,='vim'
alias ,a='vim ~/.bash_aliases && source ~/.profile'
alias ,b='vim ~/.bashrc && source ~/.bashrc'
alias ,f='vim ~/.vifm/vifmrc.vim'
alias ,p='vim ~/.profile'
alias ,v='vim ~/.vimrc'


# source profile, bashrc, aliases 
alias sp='source ~/.profile'
alias sb='source ~/.bashrc'
alias sa='source ~/.aliases.sh'


# windows:
alias ,eahk='vim /mnt/c/Users/Monica/Documents/AutoHotKey/myHotKeys.ahk'

alias i='sudo apt install '
alias u='sudo apt update -y && sudo apt upgrade -y && autoremove'


# quit or exit shell.  same as quiting vim (whitout save)
alias q='exit'

#------------------------------------------------------------------}}}


#- git aliases ----------------------------------------------------{{{
DATE=$(date +"[%Y-%m-%d %H:%M:%S]")
#echo $DATE  
alias gs='git status && git remote -v && ag git'
alias gc='git commit -m "$DATE"'
alias ga='git add'
alias gp='git push'
# mapleader = , 
alias ,gi='vim .gitignore'
alias ,gc='vim .gitconfig'
#-------------------------------------------------------------}}}


#- tmux aliases ---------------------------------------------------{{{
# tm = tmux, start a new tmux session
alias tm='tmux'
# tl = tmux list
alias tl='tmux ls'
# ta=tmux attach -t [enter session-name from tl]
alias ta='tmux a -t '
# ,et = edit .tmux.conf
alias ,t='vim ~/.tmux.conf'
#--------------------------------------------------------------}}}


#--- Clang C Cpp make aliases ------------------------------------{{{
alias ,mh='make help'
alias ,mv='make vars'
alias ,mc='make clean'
alias ,mm='make all'
alias ,mr='make run'
alias ,md='make dbg'
#--------------------------------------------------------------}}}


#- footer --------------------------------------------------------{{{
shopt -s expand_aliases
#source .bash_aliases
echo -e '\n        3... end   ' $ALIASES ' ............'
#--------------------------------------------------------------}}}


