#!/bin/bash

# make sure we're in the repo root
cd "$(dirname $0)"
CWD=$(pwd)

# 1 as argument = set external controller configs, 0 = vice versa
to_external=$1

# loop through all files in external-controller-configs/
find "external-controller-configs/" -type f -print0 | while read -d $'\0' FILE; do
	# remove external-controller-configs/ part of path
	FILE=$(echo $FILE | sed 's/external-controller-configs\///')

	#only operate on already existing symlinks
	if [ -L "$HOME/$FILE" ]; then
		rm "$HOME/$FILE"
		if [[ $to_external == 0 ]]; then
			echo "$FILE => $HOME/$FILE"
			ln -sr "$FILE" "$HOME/$FILE"
		else
			echo "external-controller-configs/$FILE => $HOME/$FILE"
			ln -sr "external-controller-configs/$FILE" "$HOME/$FILE"
		fi
	fi
done
