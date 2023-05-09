SUMMARY = "A console development image customized for the rpi"

require images/basic-image.bb

DEPENDS += "bootfiles"

WIFI = " \
    crda \
    iw \
icu \
    linux-firmware-rpidistro-bcm43455 \
    wpa-supplicant \
"

RPI_STUFF = " \
    userland \
"

IMAGE_INSTALL += " \
    dhcpcd \
    firewall \
    ${RPI_STUFF} \
    ${WIFI} \
    ${SECURITY_TOOLS} \
"

export IMAGE_BASENAME = "mybox-mainline"
