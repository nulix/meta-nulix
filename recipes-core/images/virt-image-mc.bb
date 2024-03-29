SUMMARY = "A minimal target image with virtualization tools"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

inherit core-image openrc-image

IMAGE_INSTALL = " \
    packagegroup-core-boot \
    kernel-modules \
    openrc \
    lxc \
    umoci \
    jq \
    skopeo \
    iptables \
    ${@oe.utils.conditional('TCLIBC', 'musl', 'musl-utils', '', d)} \
    chrony \
    openssh \
    oci-lighttpd-mc \
"

###
### openrc services
###
OPENRC_SERVICES = " \
   boot:hostname \
   boot:loopback \
   boot:modules \
   shutdown:killprocs \
   shutdown:mount-ro \
"

