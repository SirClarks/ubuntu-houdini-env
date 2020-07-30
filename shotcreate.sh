#!/bin/bash

# help check
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage: "shotcreate" [name of job] [new shot name]"
  exit 0
fi

JOB=${1?Error: no job name given}
SHOT=${2?Error: no shot name given}
JPATH=$HOME/FX/PROJECTS/$JOB
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
		mkdir $HPATH $HPATH/hip $HPATH/hip/backup $HPATH/geo $HPATH/renders $HPATH/texture $HPATH/flipbook
		mkdir $NPATH $NPATH/scene $NPATH/scene/backup $NPATH/renders
	fi
else
	echo "Error: Job name not found, if needed run jobcreate to create a job" 1>&2
	exit 1
fi
