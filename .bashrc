#################################
##    ~/.bashrc    ##
#####################

#--- header ---------------------------------------------------------{{{
echo '    2... begin ~/.bashrc .......\n'

# unalias all, lets start clean:-)
unalias -a
# Turn Off Software Flow Control (XON/XOFF)
stty -ixon
# use vim keybindings in bash shell
set -o vi
#------------------------------------------------------------------}}}


#--- exports ----------------------------------------------------{{{
export SHELL=/bin/bash
# do NOT export TERM here, it interferes up tmux, it is set in .tmux.conf
#export TERM=screen-256color
#export BASH_ENV='~/.bash_aliases.sh'
export ALIASES='~/.bash_aliases.sh'
export BASHRC='~/.bashrc'
export VIFMRC='~/.vifm/vifmrc.vim'
export TMUXCONF='~/.tmux.conf'
export VIMRC='~/.vimrc'
export EDITOR=/usr/bin/vim
#----------------------------------------------------------------------}}}


#  prompt -------------------------------------------------------{{{
# green prompt for regular user
PS1="\[\033[01;32m\]\w\[\033[00m\]\n"

# red prompt for root
if [ "$EUID" -eq 0 ]
    then PS1="\[\033[01;31m\]\w\[\033[00m\]\n"
fi
#-----------------------------------------------------------------}}}


# echo info ------------------------------------------------------{{{
#clear
#alias
echo "    exported shell variables:"
echo "    SHELL    =$SHELL      BASH_ENV =$BASH_ENV"
echo "    ALIASES  =$ALIASES  BASHRC   =$BASHRC"
echo "    VIMRC    =$VIMRC       VIFMRC   =$VIFMRC"
echo "    TMUXCONF =$TMUXCONF   EDITOR   =$EDITOR" 
echo
#------------------------------------------------------------------}}}


#--- expand and source aliases --------------------------{{{
shopt -s expand_aliases
source ~/.bash_aliases
#----------------------------------------------------}}}


# footer ---------------------------------------------------------{{{
echo
echo '    2... end   ~/.bashrc ........'
#------------------------------------------------------------------}}}


