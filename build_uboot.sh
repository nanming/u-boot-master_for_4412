#!/bin/sh


ROOT_DIR=`pwd`
sec_path="/home/chenxp/4412_priv/CodeSign4SecureBoot_SCP/"

make V=1 all ARCH=arm
split -b 14336 u-boot.bin bl2
make -C ~/4412_priv/iTop4412_uboot/sdfuse_q/
~/4412_priv/iTop4412_uboot/sdfuse_q/chksum
~/4412_priv/iTop4412_uboot/sdfuse_q/add_padding
rm bl2a*
rm checksum_bl2_14k.bin
cp -rf u-boot.bin $sec_path
cd $sec_path

cat E4412_N.bl1.SCP2G.bin bl2.bin all00_padding.bin u-boot.bin tzsw_SMDK4412_SCP_2GB.bin > u-boot-iTOP-4412.bin
mv u-boot-iTOP-4412.bin $ROOT_DIR

echo "build u-boot successfully!"

