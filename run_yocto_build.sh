#!/bin/bash

### Run the build
source ./layers/poky/oe-init-build-env ./build
MACHINE="raspberrypi4-64" BB_NUMBER_THREADS="6" PARALLEL_MAKE="-j 1" bitbake mybox-buildfarm-image
#MACHINE="raspberrypi4-64" BB_NUMBER_THREADS="6" PARALLEL_MAKE="-j 1" bitbake mybox-release-image

### Complete
OETMP=~/mybox_raspberry_pi4/build/tmp  MACHINE="raspberrypi4-64" 

#./create_sdcard_images.sh
