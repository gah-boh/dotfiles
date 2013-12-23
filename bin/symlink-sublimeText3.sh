#!/bin/bash

files="$HOME/Documents/dotfiles"
sublimeGeneralSnippets="$HOME/Documents/dotfiles/sublimeGeneral/spagSnippets"
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

if [[ -d "$sublime" ]]; then
	linkSublimePreferences
else
	echo "No Sublime Text Preferences install or start the app"
fi


if [[ -d "$files/sublimeGeneral" ]]; then
	echo "Symlinking sublime text spagSnippets from $files/sublimeGeneral"
else
	echo "WARNING: $files/sublimeGeneral does not exist."
	exit 0
fi

linkSublimeSpagSnippets() {
	echo "Linking spagSnippets..."
	for location in sublimeGeneral/spagSnippets/*.*; do
		file="${location##*/}"
		link "$files/$location" "$sublime/spagSnippets/$file"
	done
}

if [[ ! -d "$sublime/spagSnippets" ]]; then
	mkdir "$sublime/spagSnippets"
fi

if [[ -d "$sublimeGeneralSnippets" ]]; then
	linkSublimeSpagSnippets
else
	echo "No Sublime Text spagSnippets."
fi
