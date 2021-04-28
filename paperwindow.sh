#!/bin/bash
echo -e "                                          _           __             "
echo -e "    ____  ____ _____  ___  ______      __(_)___  ____/ /___ _      __"
echo -e "   / __ \/ __ `/ __ \/ _ \/ ___/ | /| / / / __ \/ __  / __ \ | /| / /"
echo -e "  / /_/ / /_/ / /_/ /  __/ /   | |/ |/ / / / / / /_/ / /_/ / |/ |/ / "
echo -e " / .___/\__,_/ .___/\___/_/    |__/|__/_/_/ /_/\__,_/\____/|__/|__/  "
echo -e "/_/         /_/                                                      "
echo -e " "
echo -e "PAPERWINDOW from Geschafft"
echo -e "Version: v1.0.0"
echo -e "------------------------------"
echo -e "Paperwindow is starting."
echo -e "This shouldn't take too long."
echo -e "If you just saw weird random characters,"
echo -e "that's our ASCII art and your window or"
echo -e "screen is too small to display it :/"
chmod +x /root/runner.sh
if [ -e /root/app/launcher.sh ]
then
  chmoe +x /root/app/launcher.sh
fi
/usr/bin/supervisord