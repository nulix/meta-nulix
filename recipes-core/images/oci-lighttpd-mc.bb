SUMMARY = "Package lighttpd app container image"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

do_compile[noexec] = "1"
do_install[mcdepends] = "mc:container${TARGET_ARCH}:container${TARGET_ARCH}:oci-lighttpd:do_image_complete"

do_install() {
    install -d ${D}/var/lib/oci/lighttpd
    cp -r ${TOPDIR}/tmp-container/deploy/images/container${TARGET_ARCH}/oci-lighttpd-latest-oci/* ${D}/var/lib/oci/lighttpd
}

RDEPENDS_${PN} += "lxc"

###
# mount cgroup v2 if not already:
# mount -t cgroup2 none /sys/fs/cgroup
# 
# create lxc container on target:
# lxc-create c1 -t oci -- --url oci:/var/lib/oci/lighttpd
#
# start lxc container in background:
# lxc-execute c1 -d
###
