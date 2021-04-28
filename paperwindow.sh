#!/bin/bash
echo -e "PAPERWINDOW from Geschafft"
echo -e "Version: v1.0.0"
echo -e "------------------------------"
echo -e "Paperwindow is starting."
echo -e "This shouldn't take too long."
chmod +x /root/runner.sh
if [ -e /root/app/launcher.sh ]
then
  chmod +x /root/app/launcher.sh
fi
/usr/bin/supervisord
