FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://chronyd.initd \
    file://chronyd.confd \
"

inherit openrc

OPENRC_SERVICES = "chronyd"

do_install:append() {
    rm -f ${D}${sysconfdir}/init.d/chronyd
    openrc_install_initd ${WORKDIR}/chronyd.initd
    openrc_install_confd ${WORKDIR}/chronyd.confd
}
