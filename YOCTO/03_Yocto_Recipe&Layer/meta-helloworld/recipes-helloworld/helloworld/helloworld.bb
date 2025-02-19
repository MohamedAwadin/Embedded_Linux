DESCRIPTION = "A simple Hello World application"
HOMEPAGE = "https://example.com"
LICENSE = "CLOSED"

SRC_URI = "file://ITI_45/main.c \
           file://ITI_45/CMakeLists.txt"

FILESEXTRAPATHS:prepend := "${THISDIR}/:"

S = "${WORKDIR}/ITI_45"

inherit cmake

do_compile() {
    cmake -S ${S} -B ${B}
    cmake --build ${B}
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${B}/helloworld ${D}${bindir}/helloworld
}
