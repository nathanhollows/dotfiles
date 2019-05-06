#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

TOGGLE=.toggle

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    redshift -P -O 3500K
else
    rm $TOGGLE
    redshift -x
fi
