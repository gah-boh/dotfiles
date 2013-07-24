#!/bin/bash

files="$HOME/Documents/dotfiles/webstorm"
webstorm="$HOME/Library/Preferences/Webstorm6"

if [[ -d "$files" ]]; then
	echo "Symlinking dotfiles from $files"
else
	echo "$files does not exist."
	exit 1
fi

link() {
	from="$1"
	to="$2"
	echo "Linking $from to $to"
	rm -f "$to"
	ln -s "$from" "$to"
}

if [[ -d "$webstorm" ]]; then
	echo "Linking WebStorm JavaScript snippets..."
	link "$files/templates/spagSnippets_JavaScript.xml" "$webstorm/templates/spagSnippets_JavaScript.xml"
else
	echo "WebStorm preferences not present. Install the app or start it if you haven't already."
fi
