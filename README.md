## Образ Raspberry Pi 4 


## gitlab runner
```
https://dev.to/omarcloud20/gitlab-runner-on-raspberry-pi-4-build-push-docker-images-to-docker-hub-using-gitlab-runner-on-gitlab-7m3

```




```
- meta-mybox-os-tune (Абстрагированый от железа слой - кастомизации стоковой системы )
- meta-mybox-rpi64 ( Рецепты для  железа, набор образов )
```

## Как собрать образ
#### Выгрузить репозиторий на раздел и выполнить скрипты
```
$ ./run_yocto_setup.sh
$ ./run_yocto_build.sh
```

#### Возможно потребуется установленные пакеты
```
$ apt install build-essential chrpath diffstat gawk libncurses5-dev python3-distutils texinfo
```

#### NEED FIX
В процессе сборки ругается на virt.c надо его закоментить
```
nano meta-virtualization/recipes-kernel/linux-yocto_virtualization.inc
```

```
$ modprobe g_ether host_addr=00:dc:c8:f7:75:05 dev_addr=00:dd:dc:eb:6d:f1

[   71.500508] using random self ethernet address
[   71.505083] using random host ethernet address
[   71.509647] using host ethernet address: 00:dc:c8:f7:75:05
[   71.509653] using self ethernet address: 00:dd:dc:eb:6d:f1
[   71.516087] usb0: HOST MAC 00:dc:c8:f7:75:05
[   71.526388] usb0: MAC 00:dd:dc:eb:6d:f1
[   71.530398] using random self ethernet address
[   71.535092] using random host ethernet address
[   71.542855] g_ether gadget: Ethernet Gadget, version: Memorial Day 2008
[   71.549996] g_ether gadget: g_ether readyrm 
[   71.554235] dwc2 fe980000.usb: bound driver g_ether


ifconfig usb0 192.168.1.66 up

ENABLE_DWC2_PERIPHERAL = "1" such that config.txt has the line:

#1
modprobe g_mass_storage file=/dev/mmcblk0p1 removeable=1

#2
dd if=/dev/zero of=/USB_STORAGE/image.bin bs=512 count=2880
mkdosfs /USB_STORAGE/image.bin
modprobe g_mass_storage file=/USB_STORAGE/image.bin stall=0

systemctl enable getty@ttyGS0.service

https://github.com/kmpm/rpi-usb-gadget/blob/master/rpi4-usb.sh
https://www.factoryforward.com/pi-zero-w-headless-setup-windows10-rndis-driver-issue-resolved/


https://dev.to/omarcloud20/gitlab-runner-on-raspberry-pi-4-build-push-docker-images-to-docker-hub-using-gitlab-runner-on-gitlab-7m3
https://medium.com/devops-with-valentine/use-your-raspberry-pi-to-run-gitlab-ci-jobs-8cc29fa49dbe
https://docs.gitlab.com/omnibus/settings/rpi.html
https://github.com/cydhaselton/mono-android/issues/1
https://www.opennet.ru/opennews/art.shtml?num=53981
https://yocto.yoctoproject.narkive.com/Zz9L3Xc7/bkm-on-add-src-uri-md5-and-sha256-checksum
https://unix.stackexchange.com/questions/406182/how-do-i-create-a-tun-device-for-the-actual-physical-network-interface
https://stackoverflow.com/questions/27842300/c-to-c-sharp-mono-memory-mapped-files-shared-memory-in-linux
https://learn.adafruit.com/turning-your-raspberry-pi-zero-into-a-usb-gadget/ip-addressing-options
https://stackoverflow.com/questions/59754556/start-an-electron-app-at-boot-on-raspberry-pi-3-with-yocto
https://stackoverflow.com/questions/28165774/start-a-mono-app-fullscreen-on-a-raspberry
https://forum.beagleboard.org/t/ethernet-usb0-and-dnsmasq/31973
https://raspberrypi.stackexchange.com/questions/124004/detect-rpi4-as-usb-network-interface-g-ether-dwc2
https://omar2cloud.github.io/rasp/gitlab_runner/
https://stackoverflow.com/questions/30059784/docker-access-to-raspberry-pi-gpio-pins
```
