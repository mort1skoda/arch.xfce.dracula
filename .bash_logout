# ~/.bash_logout: executed by bash(1) when login shell exits.

echo '>>>> begin ~/.bash_logout >>>>'

# when leaving the console clear the screen to increase privacy
echo "....>>>>SHLVL SHELL LEVEL==== "$SHLVL
if [ "$SHLVL" = 1 ]; then
    echo '$SHLVL = '$SHLVL
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

#if [ "$TMUX" == "" ]; then

    #echo '-----------------> git push dotfiles before quiting !!!!!!!!!'
    #echo "--------- inside if"
    #cd ~
    #gp

    #echo '----------------------------------> git push dev/c/template           !!!!!!!!!!!!!!!'
    #cd ~/dev/c/00template
    #gp

    #echo '----------------------------------> git push dev/c/getStr           !!!!!!!!!!!!!!!'
    #cd ~/dev/c/getStr
    #gp

    #echo
    #echo '-----------------> git push dotfiles READY!!        !!!!!!!!!'
#fi


echo '.... end   ~/:bash_logout ....'


echo "SHELL LEVEL = $SHLVL"

#if [ "$SHLVL" -lt 5 ]; then
    #echo "Shell level below 5 pauses auto git"
    #git status
    #git add --all
    #git status
    #gc
    #gp
#fi
#
#if [ "$SHLVL" -gt 5 ]; then
    #echo "Shell level above 4 pauses auto git"
#fi


