#!/bin/bash
echo -e "[RUNNER] Starting your app..."
cd /root/app
if [ -e /root/app/launcher.exe ]
then
  echo -e "[RUNNER] Wine is being used."
  /opt/wine-stable/bin/wine /root/app/launcher.exe
else
  echo -e "[RUNNER] Wine is not being used."
  /root/app/launcher.sh
fi