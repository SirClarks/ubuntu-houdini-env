# ubuntu-houdini-env
A simplified production-like home environment setup for houdini/nuke workflow on Linux (specifically Ubuntu 18.04/20.04). This is an extremely simple setup; however, it should be a useful starting place for your own ideas and improvements.

## Introduction
This guide is aimed at those who are very new to the world of linux and just in general fiddling with environment variables. If you know what you’re doing feel free to change the paths to satisfy your needs. 

## Software download

### Houdini
Make sure you download Houdini for Linux and follow the SideFX provided [instructions](https://www.sidefx.com/download/houdini-for-linux/

The default installation options and location being in `/opt/` should be fine. Don’t forget to delete the installer after you’re done.

### Nuke (Optional)
For Nuke it’s the exact same procedure, just unpack the downloaded file just as you did the houdini one with something like `tar -xvf nuke_download_file_name`. The only caveat is you’ll want to run the unpacked file in the folder you’ll want to install Nuke, so I just threw it in the /opt/ folder as well before running the installer. Don’t forget to delete the installer after.

## Initial Setup
### Aliases
Think of aliases as cool little shortcut commands you can type in the terminal to perform whatever you need, so we’re going to set these up next. There are arguably better ways of doing this, but we’re going for simplicity here you’ll want to open edit your `.bashrc` which should be in your Home directory. You can directly edit it using this command `sudo gedit ~/.bashrc`








