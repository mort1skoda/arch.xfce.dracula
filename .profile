# ~/.profile: executed by the command interpreter for login shells: bash --login
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists
#
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
#
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

clear
neofetch

stty -ixon
set -o vi

echo ' ~/.profile '

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



