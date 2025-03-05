SUMMARY = "Print Hello World"
DESCRIPTION = "Recipe created by bitbake-layers"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = "file://main.c"

S = "${WORKDIR}/build"

do_compile() {
    ${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/main.c -o ${S}/main
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${S}/main ${D}${bindir}/
}