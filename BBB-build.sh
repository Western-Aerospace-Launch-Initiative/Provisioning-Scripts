#!/bin/bash

# Author: Noah Braasch
# Date: 12/17/2023
# Revision: 001
# Revisor: Nathan Snyder 
#********************* 

install_compiler() {
    sudo apt install -y gcc-arm-linux-gnueabihf && g++-arm-linux-gnueabihf
}

finish_build() {
    fprime-util generate beaglebone
    fprime-util build beaglebone
}

install_compiler
git clone git@github.com:Western-Aerospace-Launch-Initiative/Provisioning-Scripts.git
mv Provisioning-Scripts/beaglebone.toolchain ../../fprime/cmake/toolchain
rm -r -f Provisioning-Scripts
fprime-util purge beaglebone -f
finish_build
