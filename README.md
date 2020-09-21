# ubuntu-houdini-env
A simplified production-like home environment setup for houdini/nuke/resolve workflow on Linux (specifically Ubuntu 18.04/20.04). Though since this is in bash, it should work with most flavors of Linux (waiting to test on CentOs). For all intents and purposes, this is a quick and dirty setup; however, it should be a useful starting place for your own ideas and improvements.

## Introduction
This guide is aimed at those who are fairly new to the world of Linux and Ubuntu as well as just in general fiddling with environment variables in Houdini.

## Software download

### Houdini
Make sure you download Houdini for Linux and follow the SideFX provided [instructions](https://www.sidefx.com/download/houdini-for-linux/)
or maybe try [this specific linux FAQ question.](https://www.sidefx.com/faq/question/511/) The default installation options and location being in `/opt/` should be fine. Don’t forget to delete the installer after you’re done. This is really important but you will find a *houdini_setup_bash* file in the install directory, you'll want to edit it follow the commented instructions provided by SideFX and this is essentially what the `job.sh` script will run. As explained later you'll point at this file via the `$HENVPATH` variable in the `config.sh` script.

### Nuke (Optional)
For Nuke it’s the exact same procedure, just unpack the downloaded file just as you did the houdini one with something like `tar -xvf nuke_download_file_name`. The only caveat is you’ll want to run the unpacked file in the folder you’ll want to install Nuke, so I just threw it in the /opt/ folder as well before running the installer. Don’t forget to delete the installer after. Once installed you can create an alias such as this one pointing wherever you ended up installing nuke `alias nk='/opt/Nuke/Nuke12.2v1/Nuke12.2 --nc'`

### Resolve (Optional)
Devinci Resolve officially supports CentOS only; however you can get it to work on Ubuntu and possibly other flavors such as Mint, through a little hackery. I highly recommend following this guide and script (that removes all the hackery needed, and makes it quick and simple) at https://www.danieltufvesson.com/makeresolvedeb. Once you've installed resolve, as with Nuke feel free to create an alias to launch resolve faster from your job environment, something such as `alias resolve='/opt/resolve/bin/resolve'`. If you're not comfortable with Resolve, there is also the option of using [Kdenlive.](https://kdenlive.org/en/) Though Kdenlive does do the trick, I highly recommend Resolve, it's Lite version is more than enough and offers UHD export, easy to use interface, and it's pretty lightweight.  

## Initial Setup
Either clone or download the repository and place it somewhere of your choosing I recommend somewhere like `~/Scripts/houdini/env/`

### config.sh
Next pop open config.sh with your favorite text editor or simply use the build in `gedit config.sh`. Here you'll want to set the paths to your own directories.
* `$PROJPATH` refers to the root directory where your "jobs" and "shots" are found for example
* `$HENVPATH` refers to where you've saved your edited *houdini_setup_bash* file that you'll source for the environment
* `$UTILPATH` refers to wherever you wish to save some useful information such as the job history log
* `$ARCHPATH` refers to the root directory where you want your archived jobs and shots to land if you choose to move them to say another hard drive.

## Remaining setup
The rest of this setup is simply changing file paths to match whatever you need, and creating aliases to the `job.sh`,`jobcreate.sh`,`shotcreate.sh`, and `jobarchive.sh` scripts. If you have any questions you probably know how to contact me, since it's most likely I've sent you here to look at it. If you need help and don't know how to contact me I recommend starting an issue and I'll try my best to respond.

# Typical Use
* Create a new job, for example `jobcreate rnd`
* Create a new shot, using `shotcreate rnd sphere`
* Now "job" into this, using `job rnd sphere`
* Launch houdini, and all your environment variables should be set. For example $GEO will point at `/rnd/sphere/houdini/geo/`, etc. You can find all the variables in the `job.sh` script and change them as needed.
