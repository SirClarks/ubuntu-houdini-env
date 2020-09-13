#!/bin/bash

# source this file in your .bashrc or make sure it's sourced by default

# place this in your bashrc and point it to this file, edit file path accordingly
#if [ -e $HOME/.bash_aliases ]; then
    #source $HOME/.bash_aliases
#fi

# edit paths to match your desired locations

# houdini env
alias job='~/Scripts/houdini/env/job.sh' # job in
alias jobcreate='~/Scripts/houdini/env/jobcreate.sh' # job create
alias shotcreate='~/Scripts/houdini/env/shotcreate.sh' # shot create
alias jobedit='gedit ~/Scripts/houdini/env/houdini/setup.sh' # edit job in settings
alias jj='~/Scripts/houdini/env/job.sh -l -l' # job in last shot
alias jjj='~/Scripts/houdini/env/job.sh -l -l' # job in last shot alt
alias jh='~/Scripts/houdini/env/job.sh -hh' # job history short
alias archivejob='~/Scripts/houdini/env/archivejob.sh' # archive shot

# alias to launch houdini
alias h='houdini -n -foreground' # open houdini must have env set

# aliases for Nuke
alias nk='/opt/Nuke/Nuke12.2v1/Nuke12.2 --nc'

# aliases for resolve
alias resolve='/opt/resolve/bin/resolve'
