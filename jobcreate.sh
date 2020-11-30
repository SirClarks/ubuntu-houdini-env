#!/bin/bash

# help check
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage: "jobcreate" [new job name]"
  exit 0
fi

# Source config settings, point this at your config.sh file
source config.sh

# if error on source config
if [ $? -eq 0 ]; then
    # echo "Config.sh loaded"
    :
else
    echo -e "\n-----CONFIG ERROR-----\nCannot find config.sh doublecheck the filepath \nand/or check config.sh for any typos"
    exit 0
fi

JOB=${1?Error: no job name given}
JPATH=$PROJPATH/$JOB
if cd $JPATH; then
	echo "Error: job already exists"
	exit 1
else
	echo "No matching job found, creating new job"
	mkdir $JPATH
fi
