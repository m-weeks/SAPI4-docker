#!/bin/bash

export DISPLAY=:0
Xvfb :0 &
$@
