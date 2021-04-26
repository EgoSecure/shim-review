#!/bin/bash 

# Redirect output to log file
rm build.log
exec > >(tee -i build.log)
exec 2>&1

CERT_FILE=egosecure.public.cer
SBAT_FILE=sbat.egosecure.csv

SRC_DIR=shim-15.4

echo ===================================
echo         COPY SHIM 15.4 SOURCES
echo ===================================
wget https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2
tar xjf shim-15.4.tar.bz2
rm shim-15.4.tar.bz2


echo ======================================================================
echo         COPY CERTIFICATE AND SBAT FILES TO SHIM BUILD DIRECTORY
echo ======================================================================
cp $CERT_FILE $SRC_DIR/ -v
cp $SBAT_FILE $SRC_DIR/data/ -v

cd $SRC_DIR

echo ===================================
echo           APPLY PATCHES
echo ===================================
patch < ../patches/0001-Fix-handling-of-ignore_db-and-user_insecure_mode.patch
patch < ../patches/0002-Fix-a-broken-file-header-on-ia32.patch
patch < ../patches/0003-mok-allocate-MOK-config-table-as-BootServicesData.patch
patch < ../patches/0004-Don-t-call-QueryVariableInfo-on-EFI-1.10-machines.patch

echo ===================================
echo     BUILD SHIM-15.4 FROM SOURCES
echo ===================================
export VENDOR_CERT_FILE=$CERT_FILE
export DEFAULT_LOADER="\\\\\\\\esbootmg.efi"
make -j4

cd ..

cp $SRC_DIR/shimx64.efi shimx64.efi-docker -v

echo ===================================
echo         COMPARE SHIM FILES
echo ===================================
echo "shim.efi           - egosecure binary shim"
echo "shimx64.efi-docker - reproduced shim build binary file"

echo "diff shim.efi shimx64.efi-docker -s"
diff shim.efi shimx64.efi-docker -s

echo "sha256sum shim.efi shimx64.efi-docker"
sha256sum shim.efi shimx64.efi-docker

