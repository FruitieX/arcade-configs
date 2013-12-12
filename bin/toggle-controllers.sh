#!/bin/bash

external_controllers=$(cat ~/controller_state)

if [[ $external_controllers == 0 ]]; then
	~/arcade-configs/external-controller-symlink.sh 1
	echo 1 > ~/controller_state
	killall -9 python dolphin-emu fceux zsnes pcsx vba vbam dgen mupen64plus mame # TODO: pids! groups?
	wahcade &
else
	~/arcade-configs/external-controller-symlink.sh 0
	echo 0 > ~/controller_state
	killall -9 python dolphin-emu fceux zsnes pcsx vba vbam dgen mupen64plus mame # TODO: pids! groups?
	wahcade &
fi
