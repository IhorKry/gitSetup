#!/bin/sh

pathToDir=$1;

if [ ${#pathToDir} -eq 0 ]; then echo "You must put path for directory in format: ./createGitProject.sh [PATH TO DIR]"; exit 0; fi;

