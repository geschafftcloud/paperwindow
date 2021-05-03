> #### Geschafft Open Source
> Paperwindow is one of the ways we give back to the open source community.

# *Paperwindow*
Host desktop software on your server and stream it to anything that has a web browser.

## Architecture
Paperwindow uses Xpra to stream content, Supervisord to manage processes, Fluxbox as a window manager, and Wine for running Windows apps when necessary. Pulseaudio is used to grab and stream audio. Most stuff runs inside Docker/X11Docker.

## Usage
Everything you need to know about using Paperwindow.

### Dependencies
If you don't need GPU acceleration, you only need these dependencies.

```
$ sudo apt-get install xvfb xserver-xephyr xorg pulseaudio
```

Otherwise you additionally need any related GPU drivers (as well as weston, xwayland, and xdotools)

### Setup
This is a base Docker image. Fork/clone it and add something to run in the `app` directory. This directory should contain all assets, and a launcher called either `launcher.sh` (for standard Linux apps) or `launcher.exe` (for Windows apps).

### Back-end usage
The `Makefile` should serve as a template for usage of Paperwindow. Keep in mind that Paperwindow does do automatic scaling, but fullscreen apps sometimes have strange behavior with this.

#### SSL
Check `run1080p-ssl` in the `Makefile` for the base command for SSL. The certificate to use should be named `cert.pem` and placed in the current working directory (symlinks should also work).

### Front-end
By default, Paperwindow serves the Xpra HTML5 client. However, you can always connect your own external modified client to it.

## Credits
Paperwindow is based off of some of the open source work of Kyle Anderson. It was modified by Cedric Kim for optimized use at Geschafft, and eventually we open-sourced our version to give back to the community.

## ASCII art logo
(May look strange on smaller screens)

```
                                          _           __             
    ____  ____ _____  ___  ______      __(_)___  ____/ /___ _      __
   / __ \/ __ `/ __ \/ _ \/ ___/ | /| / / / __ \/ __  / __ \ | /| / /
  / /_/ / /_/ / /_/ /  __/ /   | |/ |/ / / / / / /_/ / /_/ / |/ |/ / 
 / .___/\__,_/ .___/\___/_/    |__/|__/_/_/ /_/\__,_/\____/|__/|__/  
/_/         /_/                                                      

More ASCII art in asciiart.txt :)
```
