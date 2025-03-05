SUMMARY = "Qt6 QML App to Control LED on Raspberry Pi"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

DEPENDS += "qtbase qtbase-native qtdeclarative-native qtdeclarative libgpiod"

SRC_URI = "file://main.cpp \
           file://ledcontroller.h \
           file://main.qml \
           file://CMakeLists.txt \
           file://qml.qrc \
           file://ledapp.service"

S = "${WORKDIR}"


inherit qt6-cmake systemd

SYSTEMD_SERVICE:${PN} = "ledapp.service"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ledapp ${D}${bindir}

    install -d ${D}${datadir}/ledapp
    install -m 0644 ${WORKDIR}/main.qml ${D}${datadir}/ledapp/

    install -d ${D}${systemd_unitdir}/system
    install -m 0644 ${WORKDIR}/ledapp.service ${D}${systemd_unitdir}/system
}

FILES:${PN} += "${systemd_unitdir}/system/ledapp.service ${datadir}/ledapp/main.qml"