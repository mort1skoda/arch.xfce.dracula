setxkbmap no &
~/caps-to-esc.sh &



exec startxfce4

#
#TODO: make esc send <ctrl-b>
#
#xcape -e "#66=Escape;#9=Control_L|B" &
#Starting applications without a window manager
#
# It is possible to start only specific applications without a window manager,
# although most likely this is only useful with a single application,
# shown in full-screen mode. For example:
#
#~/.xinitrc
#
#...
#
#exec firefox

