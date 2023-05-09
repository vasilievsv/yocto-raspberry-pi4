#!/bin/sh


echo "Качаем Binary Support Package (BSP)"
mkdir ./bsp
git -C ./bsp clone -b dunfell git://git.yoctoproject.org/meta-raspberrypi

echo "Клонирование зависимых репозиториев"
git -C ./layers clone -b dunfell https://git.yoctoproject.org/poky.git
git -C ./layers clone -b dunfell https://git.openembedded.org/meta-openembedded
git -C ./layers clone -b dunfell https://git.yoctoproject.org/meta-security.git
git -C ./layers clone -b dunfell https://git.yoctoproject.org/meta-virtualization
git -C ./layers clone -b dunfell https://github.com/meta-qt5/meta-qt5
git -C ./layers clone -b dunfell https://git.yoctoproject.org/meta-mono
git -C ./layers clone -b dunfell https://github.com/DynamicDevices/meta-mono.git
