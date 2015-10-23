#!/bin/bash
echo " 编译 mkbootimg ..."
gcc rsa.c sha.c sha256.c fdt.c fdt_empty_tree.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c fdt_wip.c mkqcdtbootimg.c -Ilibfdt -Imincrypt -w -o mkbootimg.exe