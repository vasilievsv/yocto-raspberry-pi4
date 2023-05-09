

require images/basic-dev-image.bb

DEPENDS += "bootfiles"
IMAGE_FEATURES_append += " splash"


TOOLCHAIN_HOST_TASK:append = " nativesdk-intltool nativesdk-glib-2.0"
TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext = " nativesdk-intltool nativesdk-glib-2.0"
QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
QB_MEM:qemuarmv5 = "-m 256"
QB_MEM:qemumips = "-m 256"


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
    gtk+ twm xterm xclock \
    packagegroup-core-x11-xserver packagegroup-core-x11-base packagegroup-core-x11-utils xserver-nodm-init xserver-common \
    dhcpcd \
    dnsmasq \
    firewall \
    ${RPI_STUFF} \
    ${WIFI} \
    ${SECURITY_TOOLS} \
    ${WIREGUARD} \
"

export IMAGE_BASENAME = "mybox-buildfarm-image"
