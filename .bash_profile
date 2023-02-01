#
# ~/.bash_profile
#
DEBUG=0
echo "DEBUG=== $DEBUG"


#[[ -f ~/.bashrc ]] && . ~/.bashrc


# ~/.profile: executed by the command interpreter for login shells: bash --login
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists
#
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
#
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

echo '~/.bash_profile'
stty -ixon
set -o vi

# if running bash:  -n means if length of string is not 0
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        # source $HOME/.bashrc
      source "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi





echo 'end ~/.bash_profile'

if [ -n "$DEBUG" ]; then
    clear
    neofetch
fi

echo "SHELL LEVEL = $SHLVL"
MAX_SHELL_LEVEL=7
echo $MAX_SHELL_LEVEL

if [ "$SHLVL" -lt "$MAX_SHELL_LEVEL" ]; then
    echo "Shell level below $MAX_SHELL_LEVEL automic git pull"
    echo "git pull: "
    git pull
    pacman -Qdtq
fi

if [ "$SHLVL" -ge "$MAX_SHELL_LEVEL" ]; then
    echo "Shell level above $MAX_SHELL_LEVEL pauses auto git"
fi


