#!/bin/bash

snippets="$HOME/Documents/dotfiles/vim/UltiSnips"
vimSnippetsToLink="$HOME/.vim/UltiSnips"

linkVimSnippets() {
	echo "Linking vimSnippets..."
	for location in $snippets/*; do
		file="${location##*/}"
		echo $file
		link "$snippets/$file" "$vimSnippetsToLink/$file"
	done
}

if [[ ! -d "$vimSnippetsToLink" ]]; then
	mkdir "$vimSnippetsToLink"
fi

if [[ -d "$snippets" ]]; then
	linkVimSnippets
else
	echo "No Vim Snippets"
fi

