#!/bin/bash

# Original Source: https://labs.dese.iisc.ac.in/embeddedlab/beaglebone-black-internet-over-usb/
# Note: This script is to be run on the host linux computer, please see the 
# appropriate guide for Windows wifi tethering if needed.
#********************* 

# Link Beaglebone Black internet through USB
sudo iptables --table nat --append POSTROUTING --out-interface wlp0s20f3 -j MASQUERADE
sudo iptables --append FORWARD --in-interface wlp0s20f3 -j ACCEPT
sudo echo 1 > /proc/sys/net/ipv4/ip_forward
