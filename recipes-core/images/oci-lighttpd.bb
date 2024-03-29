SUMMARY = "A lighttpd container image"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

require recipes-extended/images/container-base.bb

OCI_IMAGE_AUTHOR = "Matija Tudan"
OCI_IMAGE_AUTHOR_EMAIL = "matija.tudan@nulix.hr"
OCI_IMAGE_TAG = "latest"
OCI_IMAGE_ENTRYPOINT = "/usr/sbin/lighttpd"
OCI_IMAGE_ENTRYPOINT_ARGS = "-f/etc/lighttpd/lighttpd.conf"

CONTAINER_SHELL = "busybox"

IMAGE_INSTALL:append = " \
    lighttpd \
    lighttpd-module-accesslog \
"

# Workaround /var/volatile for now
ROOTFS_POSTPROCESS_COMMAND += "rootfs_fixup_var_volatile ; "
rootfs_fixup_var_volatile () {
    install -m 1777 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/tmp
    install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/log
}
