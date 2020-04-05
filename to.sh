#!/bin/bash
target_location=$(find $HOME -type d -a ! -path '*[Cc]ache*' -a ! -path '*node_modules*' -a ! -path '*.git/*' -a ! -path "$HOME/.mozilla*" -print0 | fzf -i --exit-0 --read0 --print0 | xargs --null -I{} echo -en "{}\n")

if [ "$target_location" ]; then
	cd $target_location
fi
