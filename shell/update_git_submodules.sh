#!/bin/bash

####
## Parameters
####
TARGET_REQUEST=$1

####
## Init Configuration of APP
####


OFCDevBox="/Users/mayoralito/internetbrands.com/smb/OFCDevBox"
OFCDevDir="/public/templates/responsive-templates"

PULL1="git pull --recurse-submodules";
PULL2="git submodule foreach git checkout master"
PULL3="git submodule foreach git pull"
PULL_APPS_DEV="git pull origin develop";

## Get the working dir
_d="$(pwd)"

####
## Functions
####
update_nolo() {
	
	UPDATE_DIR="/nolo"
	FULL_PATH="$OFCDevBox$OFCDevDir$UPDATE_DIR"
	cd $FULL_PATH
	# cd /Users/mayoralito/internetbrands.com/smb/OFCDevBox/nolo
	
	echo "Updating $FULL_PATH submodules..."

	$PULL1
	$PULL2
	$PULL3

	echo "done! " $'\360\237\215\273'
}

update_ofc() {
	UPDATE_DIR="/officite"
	FULL_PATH="$OFCDevBox$OFCDevDir$UPDATE_DIR"
	cd $FULL_PATH
	# cd /Users/mayoralito/internetbrands.com/smb/OFCDevBox/nolo
	
	echo "Updating $FULL_PATH submodules..."

	$PULL1
	$PULL2
	$PULL3

	echo "done! " $'\360\237\215\273'
}

update_edoc() {
	UPDATE_DIR="/edoctors"
	FULL_PATH="$OFCDevBox$OFCDevDir$UPDATE_DIR"
	cd $FULL_PATH
	# cd /Users/mayoralito/internetbrands.com/smb/OFCDevBox/nolo
	
	echo "Updating $FULL_PATH submodules..."

	$PULL1
	$PULL2
	$PULL3

	echo "done! " $'\360\237\215\273'
}

update_branch() {
	
	WOoT=$1
	UPDATE_DIR="/$WOoT"
	FULL_PATH="$OFCDevBox$OFCDevDir$UPDATE_DIR"
	cd $FULL_PATH
	# cd /Users/mayoralito/internetbrands.com/smb/OFCDevBox/nolo
	
	echo "Updating $FULL_PATH submodules..."

	$PULL1
	$PULL2
	$PULL3

	echo "done! " $'\360\237\215\273'
}

update_all() {
	update_branch "nolo"
	update_branch "officite"
	update_branch "edoctors"
}

prompt_to_continue() {
	while true; do
	    read -p "Do you wish to continue?" yn
	    case $yn in
	        [Yy]* ) update_all; break;;
	        [Nn]* ) exit;;
	        * ) echo "Please answer yes or no.";;
	    esac
	done
}



var=$(pwd)
echo "The current working directory $var."



####
## Workflow
####


if [ "$TARGET_REQUEST" = "all" ]
then
    prompt_to_continue
elif [ "$TARGET_REQUEST" = "nolo" ]
then
    update_branch $TARGET_REQUEST
elif [ "$TARGET_REQUEST" = "officite" ]
then
    update_branch $TARGET_REQUEST
elif [ "$TARGET_REQUEST" = "edoctors" ]
then
    update_branch $TARGET_REQUEST
else
    echo "Please use the next options: all|nolo|officite|edoctors"
    exit
fi


## get back to old dir
# cd "$_d"

echo $'\360\237\215\273' " Now you are up-to-date. ;) Let's do some work." $'\360\237\215\273'