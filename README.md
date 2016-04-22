**A fork of OpenELEC with the following features:**
* OpenELEC 8.0 git
* Kodi 17 Krypton
* Docker 1.11.1
* Emulationstation (Herdinger fork) + sselph scraper
* RetroArch git
* VICE 2.4.24
* UAE4ARM/FS-UAE git
* F2FS/BTRFS/XFS filesystem support
* RPi3 Bluetooth working out of the box
* UNFS3 NFS server
* Custom splash

**Build command**
```
PROJECT=RPi2 DISTRO=OpenELEC make image
```

**Reformat /storage to F2FS on next boot**
```
# touch /storage/.please_reformat_f2fs
```

**Automatically backup/restore while reformatting:**
```
# touch /storage/.backup
```

**Emulationstation arguments in /storage/.config/emulationstation/emulationstation.conf**
```
EMULATIONSTATION_OPTS="--ignore-gamelist --no-splash"
```

**Docker arguments in /storage/.config/docker/docker.conf**
```
DOCKER_DAEMON_OPTS="--graph=/storage/.docker"
DOCKER_STORAGE_OPTS="--storage-driver=overlay"
```

**Out of the box Emulationstation will look for roms in /storage/roms/(amiga|mame|n64|psx|psp|snes|nes). Configured input controllers are 
DS4 (bluetooth) and keyboard. Configuration is in /storage/.config/emulationstation. The keyboard layout is as follows:**

```
Navigation = Arrow keys
A = Enter
B = Backspace
Page up = ,
Page down = .
Start = rctrl
Select = ralt
```

**Keyboard buttons in different apps**
```
Kodi shutdown menu = S
Kodi context menu = C
Emulationstation menu = RCTRL
uae4arm menu = F12
uae4arm joystick/mouse switch = F11
VICE menu = F12
Retroarch menu = F1
```

Original README.md below.

[OpenELEC](http://www.openelec.tv)

# OpenELEC - Open Embedded Linux Entertainment Center

OpenELEC runs [Kodi](http://kodi.tv), an award-winning free and open source (GPL) software media 
player and entertainment hub for digital media. For more info see http://kodi.tv .
The base system has been designed and built from the ground up to be as 
efficient as possible – consuming only tiny disk and memory footprints and
providing cutting edge hardware support to deliver a set-top box experience.

**Source code**

* https://github.com/OpenELEC/OpenELEC.tv

**Installation**

* Please read the instructions in our wiki (http://wiki.openelec.tv/index.php?title=Installation) on how to install.

**License**

* OpenELEC is released under [GPLv2](http://www.gnu.org/licenses/gpl-2.0.html). Please refer to the "licenses" folder and 
  source code for clarification on upstream licensing.

**Copyright**

* Since OpenELEC includes code from many up stream projects it includes many 
  copyright owners. OpenELEC makes NO claim of copyright on any upstream code. 
  However all OpenELEC authored code is copyright openelec.tv.
  For a complete copyright list checkout the source code to examine the headers.
  Unless expressly stated otherwise all code submitted DIRECTLY to the OpenELEC 
  project (in any form) is licensed under [GPLv2](http://www.gnu.org/licenses/gpl-2.0.html) and the Copyright is donated to 
  openelec.tv.
  This allows the project to stay manageable in the long term by giving us the
  freedom to maintain the code as part of the whole without the management 
  overhead of preserving contact with every submitter ever e.g. move to GPLv3.
  You are absolutely free to retain copyright. To retain copyright simply add a 
  copyright header to every submitted code page.
  If you are submitting code that is not your own work it is the submitters 
  responsibility to place a header stating the copyright. 

**Features**

* System size ~ 90 - 170MB
* Minimal hardware requirements
* Ultra fast boot
* Simple configuration via Kodi itself
* Plug and Play external storage

**Software**

* Kodi HTPC software – View/Manage all your media.
* Samba server – File transfer from any PC client
* SSH server – Remote console access for debugging
* IR/Bluetooth Remote Control

**Notes**

* SSH login details are user: “root” password: “openelec”.
  SSH allows command line access to your openelec.tv machine for configuration
  and file transfer. Linux/Mac clients can natively use SSH, while Windows
  users might want to try PuTTY for their terminal access.
* $HOME is mounted on /storage (the second ext4 partition on the drive). 
  All data transfered to the machine will go here, the rest of the system is
  read-only with the exception of /var (containing runtime configuration data).
* Manual update/downgrade procedure is as follows:
  Copy the snapshot (.tar) to the 'Update' network share (or /storage/.update) on
  your openelec machine. Your system will automatically upgrade during the 
  next reboot.
* Automatic mounting of filesystems is supported. Devices such as USB Flash 
  sticks can be plugged into a running machine and will be mounted to /media,
  showing up in Kodi’s GUI.
* Comments and questions are more than welcome, help is even better and patches 
  are absolutely perfect!!

**Questions/Support**

* Forums on [http://openelec.tv](http://openelec.tv)
* IRC chatroom **#openelec** on Freenode

**Happy OpenELEC'ing**
