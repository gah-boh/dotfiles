#!/bin/bash

echo "Symlinking files..."
	source "bin/symlink-dotfiles.sh"
	
echo "Symlinking Sublime Text 2..."
	source "bin/symlink-sublimeText.sh"
	
echo "Symlinking Webstrom 6..."
	source "bin/symlink-webstorm.sh"