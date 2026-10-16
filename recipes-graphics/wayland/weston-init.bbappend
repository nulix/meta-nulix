do_install:append() {
    sed -i '/^\[core\]/a shell=kiosk-shell.so' ${D}${sysconfdir}/xdg/weston/weston.ini
}
