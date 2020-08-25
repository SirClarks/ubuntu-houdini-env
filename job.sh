#!/bin/bash

# help check
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage: "job" [job name] [shotname]"
  exit 0
fi

# Source config settings, point this at your config.sh file
source $HOME/Scripts/houdini/env/config.sh

# if error on source config
if [ $? -eq 0 ]; then
    echo "Config.sh loaded"
else
    echo -e "\n-----CONFIG ERROR-----\nCannot find config.sh doublecheck the filepath \nand/or check config.sh for any typos"
    exit 0
fi

# history check
if [ "$1" == "-hh" ] || [ "$1" == "-history" ] || [ "$1" == "--history" ]; then
  echo "Last 20 Shots: "
  echo "`tail -n 15 $UTILPATH/ENV/history.txt`"
  exit 0
fi

# last job/shot load via history.txt else use the two typed arguments
if [ "$1" == "-l" ] || [ "$1" == "-l -l" ] || [ "$1" == "--last" ]; then
  LAST=$( tail -n 1 $UTILPATH/ENV/history.txt )
  echo "loading last shot: $LAST"
  read -r -a array <<< "$LAST"
  JOB=${array[1]}
  SHOT=${array[2]}
else
  JOB=${1?Error: no job name given}
  SHOT=${2?Error: no shot given}
fi

# error check just in case for -l call error
if [ -z "$JOB" ] || [ -z "$SHOT" ]; then
  echo "JOB and/or SHOT is empty, something went wrong, most likely something went wrong when trying to use --last or -l. Try manually entering the job / shot. Otherwise please take a look at the scripts"
  exit 0
fi

# set main path
HPATH=$PROJPATH/$JOB/$SHOT/

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
source $HENVPATH

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
export FLIPBOOK="$HPATH/houdini/flipbook/"

# set preferences
export HOUDINI_NO_START_PAGE_SPLASH=1
export HOUDINI_VERBOSE_ERROR=1
export HOUDINI_DISABLE_SAVE_THUMB=1
export HOUDINI_SIMPLIFIED_NODE_NAMES=1
export HOUDINI_BACKUP_DIR="$HPATH/houdini/hip/backup"

# per job overrides
if [ $JOB == 'rnd' ]
then
  # export HOUDINI_SPLASH_FILE="path/to/your/splash/screen/img.jpg"
  export HOUDINI_SPLASH_MESSAGE="$JOB | $SHOT"
else
  export HOUDINI_SPLASH_MESSAGE="$JOB | $SHOT"
fi

# write to file for history
if [[ ! -e $UTILPATH/ENV/history.txt ]]; then
  mkdir -p $UTILPATH/ENV/ && touch $UTILPATH/ENV/history.txt
  echo "no history log found, created log at $HOME/FX/UTILITY/ENV/history.txt"
fi

echo "job $JOB $SHOT" >> $UTILPATH/ENV/history.txt

# keeps the shell window open
$SHELL
