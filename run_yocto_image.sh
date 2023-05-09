#!/bin/bash
#
#   Создание образа
#

cd ./bsp/meta-mybox-rpi64/scripts


OETMP=/home/user/yocto_mybox_raspberry_pi4/build/tmp IMG=mybox-buildfarm  MACHINE="raspberrypi4-64" ./create_sdcard_images.sh
