FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://dnsmasq.initd \
    file://dnsmasq.confd \
"

inherit openrc

OPENRC_SERVICES = "dnsmasq"

do_install:append() {
    rm -f ${D}${sysconfdir}/init.d/dnsmasq
    openrc_install_initd ${WORKDIR}/dnsmasq.initd
    openrc_install_confd ${WORKDIR}/dnsmasq.confd
}
