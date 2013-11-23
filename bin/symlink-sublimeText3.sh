#!/bin/bash

files="$HOME/Documents/dotfiles"
sublime="$HOME/Library/Application Support/Sublime Text 3/Packages"

if [[ -d "$files/sublimeText3" ]]; then
	echo "Symlinking sublime text settings from $files/sublimeText3"
else
	echo "WARNING: $files/sublimeText3 does not exist."
	exit 0
fi

link() {
	from="$1"
	to="$2"
	echo "Linking $from to $to"
	rm -f "$to"
	ln -s "$from" "$to"
}

linkSublimePreferences() {
	echo "Linking preferences..."
	for location in sublimeText3/*.*; do
		file="${location##*/}"
		link "$files/$location" "$sublime/User/$file"
	done
}

linkSublimeSpagSnippets() {
	echo "Linking spagSnippets..."
	for location in sublimeText3/spagSnippets/*.*; do
		file="${location##*/}"
		link "$files/$location" "$sublime/spagSnippets/$file"
	done
}

if [[ -d "$sublime" ]]; then
	linkSublimePreferences
	linkSublimeSpagSnippets
else
	echo "No Sublime Text Preferences install or start the app"
fi
