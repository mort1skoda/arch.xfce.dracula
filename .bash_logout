# ~/.bash_logout: executed by bash(1) when login shell exits.

echo '>>>> begin ~/.bash_logout >>>>'

# when leaving the console clear the screen to increase privacy
if [ "$SHLVL" = 1 ]; then
    echo '$SHLVL = '$SHLVL
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

if [ "$TMUX" == "" ]; then

    #echo '-----------------> git push dotfiles before quiting !!!!!!!!!'
    echo
    #cd ~
    #gp

    #echo '----------------------------------> git push dev/c/template           !!!!!!!!!!!!!!!'
    #cd ~/dev/c/00template
    #gp
#
    #echo '----------------------------------> git push dev/c/getStr           !!!!!!!!!!!!!!!'
    #cd ~/dev/c/getStr
    #gp

    echo
    #echo '-----------------> git push dotfiles READY!!        !!!!!!!!!'
fi

echo '.... end   ~/:bash_logout ....'


