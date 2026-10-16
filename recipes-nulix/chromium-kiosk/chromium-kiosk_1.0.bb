SUMMARY = "Chromium Kiosk Autostart Service"
DESCRIPTION = "Launches Chromium in kiosk mode targeting the local Nginx webserver automatically after Weston initializes."
LICENSE = "CLOSED"

# Inherit the systemd class to manage automated service enablement hooks
inherit systemd

SRC_URI = " \
    file://chromium-kiosk.service \
    file://kiosk-start.sh \
"

# Configure the systemd class variables
SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = "chromium-kiosk.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

do_install() {
    # 1. Install the Systemd Service unit file
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/chromium-kiosk.service ${D}${systemd_system_unitdir}/chromium-kiosk.service

    # 2. Install the launcher helper script to system binaries
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/kiosk-start.sh ${D}${bindir}/kiosk-start.sh
}

# Explicitly declare files owned by the output package mapping array
FILES:${PN} += " \
    ${systemd_system_unitdir}/chromium-kiosk.service \
    ${bindir}/kiosk-start.sh \
"

# Ensure runtime dependencies exist on the target architecture
RDEPENDS:${PN} += "chromium-ozone-wayland weston nginx"

