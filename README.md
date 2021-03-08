# Ubuntu 20.04 Houdini Environment
A simplified production-like home environment setup for houdini/nuke/resolve workflow on Linux (specifically Ubuntu 18.04/20.04). Though since this is in bash, it should work with most flavors of Linux. For all intents and purposes, this is a quick and dirty setup; however, it should be a useful starting place for your own ideas and improvements.

## Introduction
This guide presumes that the reader has some basic knowledge of working in a Linux environment. As well as some understanding of Houdini and how it functions in regards to environment variables. Honestly, if you're just starting out learning Houdini, you have no need to setup a "job in" environment, and really don't benefit much from the tiny productivity gains one can get from doing so. This is more of a rambling of a tinkering FX artist who procrastinates by pretending to be a TD.

## Software download

### Houdini
Make sure you download Houdini for Linux and follow the SideFX provided [instructions](https://www.sidefx.com/download/houdini-for-linux/)
or maybe try [this specific linux FAQ question.](https://www.sidefx.com/faq/question/511/) The default installation options and location being in `/opt/` should be fine. Don’t forget to delete the installer after you’re done. This is really important but you will find a *houdini_setup_bash* file in the install directory, you'll want to edit it follow the commented instructions provided by SideFX and this is essentially what the `job` script will run. As explained later you'll point at this file via the `$HENVPATH` variable in the `config` script.

### Nuke (Optional)
For Nuke it’s the exact same procedure, just unpack the downloaded file just as you did the Houdini one with something like `tar -xvf nuke_download_file_name`. The only caveat is you’ll want to run the unpacked file in the folder you’ll want to install Nuke, so I just threw it in the /opt/ folder as well before running the installer. Don’t forget to delete the installer after. Once installed you can create an alias such as this one pointing wherever you ended up installing nuke `alias nk='/opt/Nuke/Nuke12.2v1/Nuke12.2 --nc'`

### Resolve (Optional)
Devinci Resolve officially supports CentOS only; however you can get it to work on Ubuntu and possibly other flavors such as Mint, through a little hackery. I highly recommend following this guide and script (that removes all the hackery needed, and makes it quick and simple) at https://www.danieltufvesson.com/makeresolvedeb. Once you've installed resolve, as with Nuke feel free to create an alias to launch resolve faster from your job environment, something such as `alias resolve='/opt/resolve/bin/resolve'`. If you're not comfortable with Resolve, there is also the option of using [Kdenlive.](https://kdenlive.org/en/) Though Kdenlive does do the trick, I highly recommend Resolve, it's Lite version is more than enough and offers UHD export, easy to use interface, and it's pretty lightweight.  

## Initial Setup
Either clone or download the repository and place it somewhere of your choosing I recommend somewhere like `~/Scripts/houdini/env/`

### Config
Next pop open `config` with your favorite text editor or simply use the build in `gedit config`. Here you'll want to set the paths to your own directories.
* `$PROJPATH` refers to the root directory where your "jobs" and "shots" are found for example
* `$HENVPATH` refers to where you've saved your edited *houdini_setup_bash* file that you'll source for the environment
* `$UTILPATH` refers to wherever you wish to save some useful information such as the job history log
* `$ARCHPATH` refers to the root directory where you want your archived jobs and shots to land if you choose to move them to say another hard drive.
* `$OTLPATH` refers to the root directory where you want to "append" a list of personal OTLs, this is nice when wanting to keep a centralized OTLs directory outside the typical OTL folder found in your current version of Houdini.

## Remaining setup
The rest of this setup is simply changing file paths to match whatever you need, and creating aliases to the `job`,`jobcreate`,`shotcreate`, and `jobarchive` scripts. If you have any questions, then you probably know how to contact me, since it's most likely I've sent you here to look at this. If you need help and don't know how to contact me I recommend that you create an issue titled something like "setup help" and I'll try my best to respond.

## Typical Use
### Example
* Create a new job, for example `jobcreate rnd`
* Create a new shot, using `shotcreate rnd sphere
* You can list all the jobs with `job -list` or use `job -listfull` to list jobs and their corresponding shots. You should see your newly created shot: sphere in job: rnd.
* Now "job" into that shot, using `job rnd sphere`
* Launch houdini, and all your environment variables should be set. For example $GEO will point at `/rnd/sphere/houdini/geo/`, etc. You can find all the variables in the `job` script and change them as needed.

### `-alt` Argument
A few of the commands have the argument for -alt which should help you setup alternative drives that hold jobs/shots or houdini_setups_bash scripts for launching alternative versions of Houdini. The can be configured in the `config_bash` file an example of which exists with `PROJPATH2` variable acting as an alternative drive directory.

### Help
Finally, you can bring up help on any script using a `-h` or `--help` for example `job --help`

### Additional Useful Resources
Here are some additional useful resources I've found useful when working on personal projects or just navigating Linux life.
* **MATE for Ubuntu 20.04** - which seemed to be a popular choice over the default GNOME as a Desktop Environment:[How to install MATE desktop on Ubuntu 20.04](https://linuxconfig.org/how-to-install-mate-desktop-on-ubuntu-20-04-focal-fossa-linux) Personally I prefer using this for the workspace grid and that studio feel. Note you might have to look up some little tips and tricks on getting some things to look right, especially with any potential screen tearing caused by some NVIDIA cards/drivers. Alternatively, you can look at getting [Ubuntu Mate](Matehttps://ubuntu-mate.org/) a good to go package so you don't need to install MATE over your current Ubuntu GNOME desktop. Though I have not tried this flavor of Ubuntu myself.
* **DJV** - a solid and open source image viewer when you don't feel like sourcing Houdini for mplay, or would like a bit more options when it comes to playback and color management :[DJV Homepage](https://darbyjohnston.github.io/DJV/)
