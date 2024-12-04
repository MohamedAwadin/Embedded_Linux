# Na2na2a Task

## Q1. List the available shells in your system.

> Command to List Available Shells:

```bash
cat /etc/shells 
```
> Output 
```plaintext 
# /etc/shells: valid login shells
/bin/sh
/bin/bash
/usr/bin/bash
/bin/rbash
/usr/bin/rbash
/bin/dash
/usr/bin/dash
```
Screenshot  1
<p align='center'>
<img width="95%" src="./images/q1_shell.png"/>
</p> 

## Q2. List the environment variables in your current shell.

> Command to List Environment Variables:

```bash
env
```
> Output 

```plaintext 
SHELL=/bin/bash
ROS_VERSION=1
SESSION_MANAGER=local/Awadin:@/tmp/.ICE-unix/2906,unix/Awadin:/tmp/.ICE-unix/2906
QT_ACCESSIBILITY=1
COLORTERM=truecolor
XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg
XDG_MENU_PREFIX=gnome-
GNOME_DESKTOP_SESSION_ID=this-is-deprecated
PKG_CONFIG_PATH=/opt/ros/noetic/lib/pkgconfig
ROS_PYTHON_VERSION=3
TERMINATOR_DBUS_PATH=/net/tenshu/Terminator2
LC_ADDRESS=en_GB.UTF-8
GNOME_SHELL_SESSION_MODE=ubuntu
LC_NAME=en_GB.UTF-8
SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
TERMINATOR_UUID=urn:uuid:bd584453-f1f0-40d6-95f9-08c465bae0fd
XMODIFIERS=@im=ibus
DESKTOP_SESSION=ubuntu
LC_MONETARY=en_GB.UTF-8
SSH_AGENT_PID=2868
ROS_PACKAGE_PATH=/opt/ros/noetic/share
GTK_MODULES=gail:atk-bridge
ROSLISP_PACKAGE_DIRECTORIES=
PWD=/home/awadin
LOGNAME=awadin
XDG_SESSION_DESKTOP=ubuntu
XDG_SESSION_TYPE=x11
GPG_AGENT_INFO=/run/user/1000/gnupg/S.gpg-agent:0:1
XAUTHORITY=/run/user/1000/gdm/Xauthority
GJS_DEBUG_TOPICS=JS ERROR;JS LOG
WINDOWPATH=2
HOME=/home/awadin
USERNAME=awadin
IM_CONFIG_PHASE=1
LC_PAPER=en_GB.UTF-8
LANG=en_US.UTF-8
ROS_ETC_DIR=/opt/ros/noetic/etc/ros
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
XDG_CURRENT_DESKTOP=ubuntu:GNOME
VTE_VERSION=6003
CMAKE_PREFIX_PATH=/opt/ros/noetic
INVOCATION_ID=6a542470ddbe4533b011e83134c29be5
TERMINATOR_DBUS_NAME=net.tenshu.Terminator23558193cd9818af7fe4d2c2f5bd9d00f
MANAGERPID=2725
GJS_DEBUG_OUTPUT=stderr
LESSCLOSE=/usr/bin/lesspipe %s %s
XDG_SESSION_CLASS=user
PYTHONPATH=/opt/ros/noetic/lib/python3/dist-packages
TERM=xterm-256color
LC_IDENTIFICATION=en_GB.UTF-8
LESSOPEN=| /usr/bin/lesspipe %s
USER=awadin
DISPLAY=:1
SHLVL=1
LC_TELEPHONE=en_GB.UTF-8
ROS_MASTER_URI=http://localhost:11311
QT_IM_MODULE=ibus
LC_MEASUREMENT=en_GB.UTF-8
PAPERSIZE=a4
LD_LIBRARY_PATH=/opt/ros/noetic/lib
XDG_RUNTIME_DIR=/run/user/1000
LC_TIME=en_GB.UTF-8
LC_ALL=en_US.UTF-8
JOURNAL_STREAM=8:60727
XDG_DATA_DIRS=/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop
PATH=/opt/ros/noetic/bin:/home/awadin/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
GDMSESSION=ubuntu
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
ROS_ROOT=/opt/ros/noetic/share/ros
ROS_DISTRO=noetic
GIO_LAUNCHED_DESKTOP_FILE_PID=13770
GIO_LAUNCHED_DESKTOP_FILE=/usr/share/applications/terminator.desktop
LC_NUMERIC=en_GB.UTF-8
_=/usr/bin/env
```

> Command to Copy Environment Variables to a File

```bash
env > env_vars.txt
```

Screenshot 2
<p align='center'>
<img width="95%" src="./images/env.png"/>
</p> 

## Q3.Display your current shell name.

> Command to Display current shell name

```bash
echo $SHELL
```
> Output 

```plaintext 
/bin/bash
```
Screenshot 3
<p align='center'>
<img width="95%" src="./images/q3shell.png"/>
</p> 

## Q4. Execute the following command : echo \ then press enter,  What is the purpose of \ ?

> When i try to execute the command:

```bash
echo \
> Hello 
Hello
```
> The purpose of \ .

The shell treats the backslash as escaping the newline (Enter key), effectively continuing the command onto the next line. It will display a secondary prompt (e.g., > or similar), waiting for further input.

Screenshot 4
<p align='center'>
<img width="95%" src="./images/q4echo.png"/>
</p> 


## Q5. 5. Create a Bash shell alias named PrintPath for the “echo $PATH” command

> Command to Create Alias Variable 

```bash 
alias PrintPath='echo $PATH'
```

> Now I can Try my New Alias 

```bash 
PrintPath
```
> Output

```plaintext
/opt/ros/noetic/bin:/home/awadin/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```

Screenshot 5
<p align='center'>
<img width="95%" src="./images/alias.png"/>
</p> 
