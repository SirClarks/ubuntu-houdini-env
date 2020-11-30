#!/bin/bash

# help check
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage: "archivejob" [job name] "
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
APATH=$ARCHPATH
OPATH=$ARCHPATH/$JOB

# make new dir
[[ -d "$APATH" ]] || mkdir -p "$APATH"
mv "$JPATH" "$APATH"
echo "Job archived from $JPATH to $OPATH"

# make symlink
ln -s "$OPATH" "${JPATH%/}"
echo "symlink created at $JPATH pointing at $OPATH"
