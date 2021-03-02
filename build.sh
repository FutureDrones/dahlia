#!/bin/bash
source configs/build*.sh

git clone --depth=1 --single-branch https://github.com/dahliaOS/buildroot /drone/src/build/
cd /drone/src/build/ 

# Build 
make&&qemu-system-x86_64 --enable-kvm -m 4096 -cdrom output/images/rootfs.iso9660&&cp output/images/rootfs.iso9660 output/images/rootfs.iso

# Upload 
cd output/images/ 
transfer wet rootfs.iso 