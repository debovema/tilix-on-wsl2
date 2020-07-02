@echo off

ubuntu2004.exe run "sh -ic 'if [ -z \"$(pidof dbus-launch)\" ]; then export DISPLAY=\"$(grep -oP \"(?<=nameserver ).+\" /etc/resolv.conf):0.0\"; dbus-launch --exit-with-x11; fi;'"

ubuntu2004.exe run "cd '%1'; cd \"$(wslpath '%1')\"; export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0 ; exec tilix" rem --maximize --window-style=borderless