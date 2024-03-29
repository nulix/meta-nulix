FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://lxc-net \
    file://lxc.initd \
    file://lxc.confd \
"

inherit openrc

OPENRC_SERVICES = "lxc"

do_install:append() {
    install -d ${D}${sysconfdir}/default
    install -m 0644 ${WORKDIR}/lxc-net ${D}${sysconfdir}/default

    rm -f ${D}${sysconfdir}/init.d/lxc-containers
    openrc_install_initd ${WORKDIR}/lxc.initd
    openrc_install_confd ${WORKDIR}/lxc.confd
}
