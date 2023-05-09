require mono-4.xx.inc
require mono-mit.inc
require ${PN}-base.inc
require mono-${PV}.inc

RDEPENDS_${PN} =+ "bash"

do_package_qa[noexec] = "1"
#CACHED_CONFIGUREVARS += "ac_cv_path_DOLT_BASH='/usr/bin/env bash'"

PACKAGES += "${PN}-profiler "
FILES_${PN}-profiler += " ${datadir}/mono-2.0/mono/profiler/*"
