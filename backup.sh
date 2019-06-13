#!/bin/bash

## A simple backup solution which makes a directory in $HOME called "Backups"
## and makes a directory for all backups called the same as the directory that's
## trying to get backed up. In each backup direcory there are 5 different "stage"
## directories which get occupied and and files deleted as backups goes on.

bakdir=$HOME/Backups/${PWD##*/}

# Checking for the the backup directory in $HOME
if [ -d "$HOME/Backups" ]
then
	echo "Found $HOME/Backups"
else
	echo "Could not find any backup folder, creating $HOME/Backups"
	mkdir "$HOME/Backups"
fi

# Checking if the current directory already has been backed up once
if [ -d "$bakdir" ]
then
	echo "Initial backup already created"
else
	echo "Created ${PWD##*/} in backups"
	mkdir $bakdir
	mkdir $bakdir/Stage1 $bakdir/Stage2 $bakdir/Stage3 $bakdir/Stage4 $bakdir/Stage5
fi

# Copying all files to the backup folder and moving/deleting as neceassary
echo "Backing up..."
rm -r $bakdir/Stage5/*
cp -r $bakdir/Stage4/* $bakdir/Stage5/ 
rm -r $bakdir/Stage4/*
cp -r $bakdir/Stage3/* $bakdir/Stage4/ 
rm -r $bakdir/Stage3/*
cp -r $bakdir/Stage2/* $bakdir/Stage3/ 
rm -r $bakdir/Stage2/*
cp -r $bakdir/Stage1/* $bakdir/Stage2/ 
rm -r $bakdir/Stage1/*
cp -r * $bakdir/Stage1
echo "Backup completed!"
