#!/bin/bash


modprobe libcomposite


mkdir /sys/kernel/config/usb_gadget/multiDeskBoard
cd /sys/kernel/config/usb_gadget/multiDeskBoard

#hardware id setzen
echo 0x0419 > bcdDevice
echo 0x0200 > bcdUSB
echo 0x1d6b > idVendor
echo 0x0104 > idProduct

#Geraetetyp setzen
echo 0xEF > bDeviceClass
echo 0x02 > bDeviceSubClass
echo 0x01 > bDeviceProtocol
echo 0x08 > bMaxPacketSize0

#klartextbeschreibung setzen
mkdir strings/0x409
mkdir strings/0x407
cd strings/0x409
echo "RSI_HUD_Solutions" > manufacturer
echo "MultiDeskBoard" > product
echo "1337" > serialnumber
cd ../../
cd strings/0x407
echo "RSI_HUD_Solutions" > manufacturer
echo "MultiDeskBoard" > product
echo "1337" > serialnumber
cd ../../

#geraetefunktion setzen
mkdir functions/mass_storage.usb0



#Mass Storage 0 Konfiguration setzen
cd functions/mass_storage.usb0
echo 0 > stall
echo 1 > lun.0/removable
echo 0 > lun.0/ro
echo /USB_STORAGE/image.bin > lun.0/file
cd ../../

#OS Descriptor fuer Windoof setzen
cd os_desc
echo 1 > use
echo 0xcd > b_vendor_code
echo MSFT100 > qw_sign
cd ../

#Bus Hardware Konfig anlegen und verlinken
mkdir configs/c.1
cd configs/c.1
echo 0x80 > bmAttributes
echo 100 > MaxPower
mkdir strings/0x409
echo "MDB Config1" > strings/0x409/configuration
mkdir strings/0x407
echo "MDB Config1" > strings/0x407/configuration
cd ../../
ln -s functions/mass_storage.usb0 configs/c.1
ln -s configs/c.1 os_desc

#Geraet aktivieren
ls /sys/class/udc > UDC