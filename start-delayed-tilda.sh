#!/bin/bash

# This script is in my autostart. The delay is necessary.
# If tilda is started before compositing is initialized
# (or something like that), transparency settings
# will not work.

sleep 5
/usr/bin/tilda &
