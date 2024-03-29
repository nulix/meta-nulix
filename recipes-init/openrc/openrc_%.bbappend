FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://networking.initd \
    file://interfaces \
"

do_install:append() {
    install -d ${D}/${sysconfdir}/network
    install -m 644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network
    install -m 755 ${WORKDIR}/networking.initd ${D}${OPENRC_INITDIR}/networking
    ln -snf ${OPENRC_INITDIR}/networking ${D}${sysconfdir}/runlevels/boot
    rm -f ${D}${sysconfdir}/runlevels/boot/loopback
    rm -f ${D}${sysconfdir}/runlevels/boot/network
}

