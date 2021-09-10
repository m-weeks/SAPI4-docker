#!/bin/bash

export DISPLAY=:0
xdpyinfo -display :0 >/dev/null 2>&1 && echo "Xvfb already started" || Xvfb :0 &
$@
