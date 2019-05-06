#!/bin/sh

if ifconfig -a | grep -q tun0 ; then
    nmcli connection down "PIA - New Zealand"
else
    nmcli connection up "PIA - New Zealand"
fi
