FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y build-essential git bsdmainutils wget dos2unix

RUN mkdir /build
COPY build-shim.sh egosecure.public.cer sbat.egosecure.csv shim.efi /build/
COPY patches/*.patch /build/patches/
WORKDIR /build

RUN chmod +x build-shim.sh 
RUN ./build-shim.sh

RUN hexdump -Cv shim-15.4/shimx64.efi > shim.build.hex
RUN hexdump -Cv shim.efi              > shim.orig.hex
RUN  diff -u shim.orig.hex shim.build.hex
