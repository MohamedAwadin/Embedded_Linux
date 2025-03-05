SUMMARY = "Print Hello World"
DESCRIPTION = "Recipe created by bitbake-layers"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

#SRC_URI = "file://main.c"
SRC_URI = "git://github.com/MohamedAwadin/Standard_Embedded_Systems_Diploma.git;protocol=https;branch=main"
SRCREV = "4d57368622c72b39459dced1a387b5c07dedad0d"


S = "${WORKDIR}/git/C_programming/sheet1/problem_1"

do_compile() {
    ${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/git/C_programming/sheet1/problem_1/main.c -o ${S}/main
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${S}/main ${D}${bindir}/
}