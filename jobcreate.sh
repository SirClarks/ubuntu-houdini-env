#!/bin/bash

# help check
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage: "jobcreate" [new job name]"
  exit 0
fi

JOB=${1?Error: no job name given}
JPATH=/media/$USER/data/FX/jobs/$JOB
if cd $JPATH; then
	echo "Error: job already exists"
	exit 1
else
	echo "No matching job found, creating new job" 
	mkdir $JPATH
fi

