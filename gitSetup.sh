#!/bin/sh

FYEL="\033[33m" # foreground yellow
pathToDir=$1;

if [ ${#pathToDir} -eq 0 ]; then echo "You must put path for directory in format: ./createGitProject.sh [PATH TO DIR]"; exit 0; fi;

if [ ! -d $pathToDir ]
then
    echo "$FYEL warning: $pathToDir is not exists on your filesystem, but it will be created right now \e[0m";
    mkdir -p $pathToDir;
fi
