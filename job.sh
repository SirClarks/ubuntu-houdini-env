#!/bin/bash

# help check
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage: "job" [job name] [shotname]"
  exit 0
fi

if [ "$1" == "-hh" ] || [ "$1" == "-history" ] || [ "$1" == "--history" ]; then
  echo "Last 20 Shots: "
  echo "`tail -n 15 $HOME/FX/UTILITY/ENV/history.txt`"
  exit 0
fi

if [ "$1" == "-l" ] || [ "$1" == "-l -l" ]; then
  LAST=$( tail -n 1 $HOME/FX/UTILITY/ENV/history.txt )
  echo "loading last shot: $LAST"
  read -r -a array <<< "$LAST"
  JOB=${array[0]}
  SHOT=${array[1]}
  echo "debug JOB is $JOB and shot is $SHOT"
else
  JOB=${1?Error: no job name given}
  SHOT=${2?Error: no shot given}
fi

# error check just in case for history call
if [ -z "$JOB" ] || [ -z "$SHOT" ]; then
   echo "JOB and/or SHOT is empty, something went wrong, please try again not using -l or check the scripts"
   exit 0
fi

HPATH=$HOME/FX/PROJECTS/$JOB/$SHOT/

if cd $HPATH; then
	echo "Entering $JOB/$SHOT"
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
export ASSETS="$HPATH/houdini/assets/"
export RENDER="$HPATH/houdini/renders/"
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
	# export HOUDINI_SPLASH_FILE="/media/$USER/data/FX/jobs/config/splash/caveman.png"
	export HOUDINI_SPLASH_MESSAGE="$JOB | $SHOT"
else
	export HOUDINI_SPLASH_MESSAGE="$JOB | $SHOT"
fi

# write to file for history
if [[ ! -e $HOME/FX/UTILITY/ENV/history.txt ]]; then
    touch $HOME/FX/UTILITY/ENV/history.txt
    echo "no history log found, created log at $HOME/FX/UTILITY/ENV/history.txt"
fi

echo "$JOB $SHOT" >> $HOME/FX/UTILITY/ENV/history.txt

$SHELL
