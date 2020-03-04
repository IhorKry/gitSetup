#!/bin/sh

OPEN_YELLOW_TEXT_COLOR="\033[33m";
CLOSE_COLOR_FORMATTING="\e[0m";
OPEN_RED_TEXT_COLOR="\033[0;31m";
pathToDir=$1;

if [ ${#pathToDir} -eq 0 ]; then echo "$OPEN_RED_TEXT_COLOR You must put path for directory in format: ./gitSetup.sh [PATH TO DIR]"; exit 1; fi;

if [ ! -d $pathToDir ]
then
    echo "$OPEN_YELLOW_TEXT_COLOR warning: $pathToDir is not exists on your filesystem, but it will be created right now $CLOSE_COLOR_FORMATTING";
    mkdir -p $pathToDir;
fi

cd $pathToDir;
git init;

echo "Please, input user name for project. If you leave this fields empty - it will be reading from global config: $(git config --global user.name)";
read userName;
if [ ! ${#userName} -eq 0 ]; then git config --local user.name $userName; fi;

echo "Please, input user email for project. If you leave this fields empty - it will be reading from global config: $(git config --global user.email)";
read userEmail;
if [ ! ${#userEmail} -eq 0 ]; then git config --local user.email $userEmail; fi;

echo "* text=auto" > .gitattributes;
git add .gitattributes;
git commit -m "Initial setup";

exit 0;
