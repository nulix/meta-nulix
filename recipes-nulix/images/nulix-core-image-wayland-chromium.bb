require recipes-boundary/images/ezurio-core-image-base.bb

IMAGE_INSTALL:append = " \
    htop \
    psplash \
    chromium-ozone-wayland \
    weston \
    nginx \
    chromium-kiosk \
"

