SUMMARY = "Custom Yocto Image with Qt6, Wayland, and LED App"
inherit core-image

IMAGE_FEATURES += "splash ssh-server-openssh"

IMAGE_INSTALL:append = " \
    ledapp \
    qtbase \
    qtdeclarative \
    qtwayland \
    weston \
    weston-init \
    liberation-fonts \
    libgpiod \
    libgpiod-tools \
    systemd \
"