FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://dot.profile \
"

do_install:append() {
    install -c -m 0644 ${WORKDIR}/dot.profile ${D}/root/.profile

    # Dynamically inject boot partition mount to the fstab file
    echo "/dev/mmcblk0p1      /boot      vfat      noatime,sync      0  0" >> ${D}${sysconfdir}/fstab
}
