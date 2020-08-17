# ubuntu-houdini-env
A simplified production-like home environment setup for houdini/nuke/resolve workflow on Linux (specifically Ubuntu 18.04/20.04). This is a quick and dirty setup; however, it should be a useful starting place for your own ideas and improvements.

## Introduction
This guide is aimed at those who are very new to the world of Linux and Ubuntu as well as just in general fiddling with environment variables in Houdini.

## Software download

### Houdini
Make sure you download Houdini for Linux and follow the SideFX provided [instructions](https://www.sidefx.com/download/houdini-for-linux/

The default installation options and location being in `/opt/` should be fine. Don’t forget to delete the installer after you’re done.

## Initial Setup
Either clone or download the repository and place it somewhere of your choosing I recommend somewhere like `~/Scripts/houdini/env/`

### config.sh
Next pop open config.sh with your favorite text editor or simply use the build in `gedit config.sh`. Here you'll want to set the paths to your own directories.
* `$PROJPATH` refers to the root directory where your "jobs" and "shots" are found for example
* `$HENVPATH` refers to where you've saved your edited houdini_setup_bash file that you'll source for the environment
* `$UTILPATH` refers to wherever you wish to save some useful information such as the job history log
* `$ARCHPATH` refers to the root directory where you want your archived jobs and shots to land if you choose to move them to say another harddrive.

# (Update) Aug 17th, 2020 - Readme still in WIP progress

## Extras

### Nuke (Optional)
For Nuke it’s the exact same procedure, just unpack the downloaded file just as you did the houdini one with something like `tar -xvf nuke_download_file_name`. The only caveat is you’ll want to run the unpacked file in the folder you’ll want to install Nuke, so I just threw it in the /opt/ folder as well before running the installer. Don’t forget to delete the installer after.

### Resolve (Optional)
Devinci Resolve officially supports CentOs and not Ubuntu, I highly recommend following this https://www.danieltufvesson.com/makeresolvedeb
