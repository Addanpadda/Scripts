#!/bin/bash
echo -e "$(cut -f2 -d ";" .zsh_history)" | dmenu -p RUN: | xargs bash -c
