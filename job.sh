#!/bin/bash

# help check
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage: "job" [job name] [shotname]"
  exit 0
fi

JOB=${1?Error: no job name given}
SHOT=${2?Error: no shot given}
HPATH=/media/$USER/data/FX/jobs/$JOB/$SHOT/


if cd $HPATH; then
	echo "worked"
else
	echo "Could not find job/shot, run jobcreate or shotcreate if needed" 1>&2
	exit 1
fi

echo "Job set to: $JOB"
echo "Shot set to: $SHOT"
echo "Project path set to: $HPATH"

# set env
source ~/Scripts/houdini/houdini_setup_bash

# set variable paths
export SHOT=$SHOT 
export JOB=$JOB
export USER=$USER
export FULLPATH=$HPATH
export HIP="$HPATH/houdini/hip/"
export GEO="$HPATH/houdini/geo/"
export RENDER="$HPATH/houdini/render/"
export TEXTURE="$HPATH/houdini/texture/"

# set preferences
export HOUDINI_NO_START_PAGE_SPLASH=1
export HOUDINI_VERBOSE_ERROR=1
export HOUDINI_DISABLE_SAVE_THUMB=1
export HOUDINI_SIMPLIFIED_NODE_NAMES=1
export HOUDINI_BACKUP_DIR="$HPATH/hip/backup/"

# per job overrides
if [ $JOB == 'rnd' ]
then
	export HOUDINI_SPLASH_FILE="/media/$USER/data/FX/jobs/config/splash/caveman.png"
	export HOUDINI_SPLASH_MESSAGE="$JOB | $SHOT"
else
	export HOUDINI_SPLASH_MESSAGE="$JOB | $SHOT"
fi
$SHELL
