FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SPLASH_IMAGES = "file://nulix-logo-img.h;outsuffix=default"

SRC_URI += " \
    file://psplash-colors.h \
    file://psplash-bar.png \
"

do_configure:append() {
    install -m 0644 ${WORKDIR}/psplash-colors.h ${S}/psplash-colors.h
    install -m 0644 ${WORKDIR}/psplash-bar.png ${S}/base-images/psplash-bar.png
}

