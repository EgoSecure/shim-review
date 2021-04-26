Make sure you have provided the following information:

 - [X] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag  
 [EgoSecure/shim-review@egosecure-shim-x64-20210426](https://github.com/EgoSecure/shim-review/tree/egosecure-shim-x64-20210426)
 - [X] completed README.md file with the necessary information  
 https://github.com/EgoSecure/shim-review/tree/egosecure-shim-x64-20210426/README.md
 - [X] shim.efi to be signed  
 https://github.com/EgoSecure/shim-review/tree/egosecure-shim-x64-20210426/shim.efi
 - [X] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)  
 https://github.com/EgoSecure/shim-review/tree/egosecure-shim-x64-20210426/egosecure.public.cer
 - [X] binaries, for which hashes are added do vendor_db ( if you use vendor_db and have hashes allow-listed )  
Not used
 - [X] any extra patches to shim via your own git tree or as files  
 No extra patches
 - [X] any extra patches to grub via your own git tree or as files  
 GRUB bootloader is not used
 - [X] build logs  
 https://github.com/EgoSecure/shim-review/tree/egosecure-shim-x64-20210426/build.log
 - [X] a Dockerfile to reproduce the build of the provided shim EFI binaries  
 https://github.com/EgoSecure/shim-review/tree/egosecure-shim-x64-20210426/Dockerfile


###### What organization or people are asking to have this signed:
`EgoSecure is European software vendor developing Data Security products`  
`https://egosecure.com`

###### What product or service is this for:
`EgoSecure Full Disk Encryption`

###### Please create your shim binaries starting with the 15.4 shim release tar file:
###### https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2
###### This matches https://github.com/rhboot/shim/releases/tag/15.4 and contains
###### the appropriate gnu-efi source.
###### Please confirm this as the origin your shim.
`Yes, we use 15.4 shim release https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2`

###### What's the justification that this really does need to be signed for the whole world to be able to boot it:
`EgoSecure Full Disk Encryption secures data on laptops by applying sector level encryption with Pre-boot authentication.
We need to be signed because we want to distribute our product to our end users across the world. Our Pre-boot authentication has to support Secure Boot.
We have used a Microsoft SecureBoot signed Shim since 2018`

###### How do you manage and protect the keys used in your SHIM?
`The private key is stored on hardware token with restricted access`

###### Do you use EV certificates as embedded certificates in the SHIM?
`No`

###### If you use new vendor_db functionality, are any hashes allow-listed, and if yes: for what binaries ?
`Not used`

###### Is kernel upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 present in your kernel, if you boot chain includes a Linux kernel ?
`Yes, this patch is included and applied`

###### if SHIM is loading GRUB2 bootloader, are CVEs CVE-2020-14372,
###### CVE-2020-25632, CVE-2020-25647, CVE-2020-27749, CVE-2020-27779,
###### CVE-2021-20225, CVE-2021-20233, CVE-2020-10713, CVE-2020-14308,
###### CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
###### ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
###### and if you are shipping the shim_lock module CVE-2021-3418
###### fixed ?
`GRUB bootloader is not used`

###### "Please specifically confirm that you add a vendor specific SBAT entry for SBAT header in each binary that supports SBAT metadata
###### ( grub2, fwupd, fwupdate, shim + all child shim binaries )" to shim review doc ?
###### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim
`shim:`  
`shim.egosecure,1,EgoSecure GmbH a Matrix42 Company,shim,15.4,https://egosecure.com`

##### Were your old SHIM hashes provided to Microsoft ?
`Yes`

##### Did you change your certificate strategy, so that affected by CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
##### CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
##### CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705 ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
##### grub2 bootloaders can not be verified ?
`GRUB bootloader is not used`

##### What exact implementation of Secureboot in grub2 ( if this is your bootloader ) you have ?
##### * Upstream grub2 shim_lock verifier or * Downstream RHEL/Fedora/Debian/Canonical like implementation ?
`GRUB bootloader is not used`

###### What is the origin and full version number of your bootloader (GRUB or other)?
`GRUB bootloader is not used`

###### If your SHIM launches any other components, please provide further details on what is launched
`The SHIM launches our pre-boot authentication component (custom second-state loader) that can perform user verification, system decryption actions, and boot a Windows OS or Linux kernel.`

###### If your GRUB2 launches any other binaries that are not Linux kernel in SecureBoot mode,
###### please provide further details on what is launched and how it enforces Secureboot lockdown
`GRUB bootloader is not used`

###### If you are re-using a previously used (CA) certificate, you
###### will need to add the hashes of the previous GRUB2 binaries
###### exposed to the CVEs to vendor_dbx in shim in order to prevent
###### GRUB2 from being able to chainload those older GRUB2 binaries. If
###### you are changing to a new (CA) certificate, this does not
###### apply. Please describe your strategy.
`GRUB bootloader is not used`

###### How do the launched components prevent execution of unauthenticated code?
`The integrity of each file in our boot chain is verified by checking the validity of the digital signature using shim's protocol.
All our componets have digital signature`

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
`No`

###### What kernel are you using? Which patches does it includes to enforce Secure Boot?
`Linux kernel 5.5.7, which has the all the required patches to enforce the secure boot`

###### What changes were made since your SHIM was last signed?
`Update shim version to 15.4`

###### What is the SHA256 hash of your final SHIM binary?
`2995bb22bf65facfe0601214dba68e05cca8647c79e8461e320b8983d6067077`
