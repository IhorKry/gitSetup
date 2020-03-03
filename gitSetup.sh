#!/bin/sh

FYEL="\033[33m" # foreground yellow
pathToDir=$1;

if [ ${#pathToDir} -eq 0 ]; then echo "You must put path for directory in format: ./createGitProject.sh [PATH TO DIR]"; exit 0; fi;

if [ ! -d $pathToDir ]
then
    echo "$FYEL warning: $pathToDir is not exists on your filesystem, but it will be created right now \e[0m";
    mkdir -p $pathToDir;
fi

cd $pathToDir;
git init;

echo "Please, input user name for project. If you leave this fields empty - it will be written from global config";
read userName;
if [ ${#userName} -eq 0 ]
then
    git config --local user.name "$(git config --global user.name)";
else
    git config --local user.name $userName;
fi

echo "Please, input user email for project. If you leave this fields empty - it will be written from global config";
read userEmail;
if [ ${#userEmail} -eq 0 ]
then
    git config --local user.email $(git config --global user.email);
else
    git config --local user.email $userEmail;
fi

echo "* text=auto" > .gitattributes
git add .gitattributes
git commit -m "Initial setup"

exit
