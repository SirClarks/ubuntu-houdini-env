#!/bin/bash

# help check
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage: "shotcreate" [name of job] [new shot name]"
  exit 0
fi

# Source config settings, point this at your config.sh file
source $HOME/Scripts/houdini/env/config.sh

# if error on source config
if [ $? -eq 0 ]; then
    echo Config.sh loaded
else
    echo -e "\n-----CONFIG ERROR-----\nCannot find config.sh doublecheck the filepath \nand/or check config.sh for any typos"
    exit 0
fi

# A lot of optionals here just go through and edit for what you need.
# For example there are a lot of directories related to Nuke/Resolve or
# other more specific directories such as hip/log.

JOB=${1?Error: no job name given}
SHOT=${2?Error: no shot name given}
JPATH=$PROJPATH/$JOB
SPATH=$JPATH/$SHOT
if cd $JPATH; then
	if cd $SPATH; then
		echo "Error: shot already exists"
		exit 1
	else
		echo "No matching shot found, creating new shot"
		mkdir $SPATH
		HPATH=$SPATH/houdini
		NPATH=$SPATH/nuke
    RPATH=$SPATH/resolve
		mkdir $HPATH $HPATH/hip $HPATH/hip/backup $HPATH/hip/log $HPATH/geo $HPATH/renders $HPATH/texture $HPATH/flipbook $HPATH/assets
		mkdir $NPATH $NPATH/scene $NPATH/scene/backup $NPATH/renders
    mkdir $RPATH $RPATH/backup
  fi
else
	echo "Error: Job name not found, if needed run jobcreate to create a job" 1>&2
	exit 1
fi
