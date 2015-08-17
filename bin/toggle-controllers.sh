#!/bin/bash

if [[ $1 == 'xbox360' ]]; then
    # enable external controllers
	bash ~/arcade-configs/external-controller-symlink.sh 1
	killall -9 python2 retroarch dolphin-emu
	DISPLAY=:0 wahcade &
else
    # enable arcade controllers
	bash ~/arcade-configs/external-controller-symlink.sh 0
	killall -9 python2 retroarch dolphin-emu
	DISPLAY=:0 wahcade &
fi
