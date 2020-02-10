#!/bin/bash
find Scripts | grep .sh | fzf | xargs -r vim
