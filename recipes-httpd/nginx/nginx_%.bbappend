FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://index.html"

do_install:append() {
    install -d ${D}/var/www/localhost/html
    install -m 0644 ${WORKDIR}/index.html ${D}/var/www/localhost/html/index.html
}

