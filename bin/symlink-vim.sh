#!/bin/bash

files="$HOME/Documents/dotfiles"
vimSnippetsOrig="$HOME/Documents/dotfiles/vim/snippets"
vimSnippetsToLink="$HOME/.vim/snippets"

linkVimSnippets() {
	echo "Linking vimSnippets..."
	for location in $vimSnippetsOrig/*.*; do
		file="${location##*/}"
		link "$files/$location" "$vimSnippetsToLink/$file"
	done
}

if [[ ! -d "$vimSnippetsToLink" ]]; then
	mkdir "$vimSnippetsToLink"
fi

if [[ -d "$vimSnippetsOrig" ]]; then
	linkVimSnippets
else
	echo "No Vim Snippets"
fi

