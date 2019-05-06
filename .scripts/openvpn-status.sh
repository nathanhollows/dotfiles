#!/bin/sh

if ifconfig -a | grep -q tun0 ; then
    echo ""
else
    echo ""
fi
