#!/bin/bash

# Written By Noah Braasch 2023
# Must run with root access

# Setup Default Gateway
/sbin/route add default gateway 192.168.7.1

#Add nameservers
echo "domain localdomain" >> /etc/resolv.conf
echo "search localdomain" >> /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
