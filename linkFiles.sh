#!/bin/bash

echo "Symlinking home folder files..."
	source "bin/symlink-dotfiles.sh"

echo "Symlinking vim snippets..."
	source "bin/symlink-vim.sh"
	
echo "Symlinking Sublime Text 3..."
	source "bin/symlink-sublimeText3.sh"
	
