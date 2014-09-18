#!/bin/bash

snippets="$HOME/Documents/dotfiles/vim/snippets"
vimSnippetsToLink="$HOME/.vim/snippets"

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

