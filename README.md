
Android Tree for Asus TF201T
============================

This build tree is mainly used for building Multirom and TWRP-Multirom for the 
Asus Transformer Prime (TF201).

* **Multirom** is a *bootloader*, which can start diffenent Android versions or generic 
linux distributions like ubuntu (touch), Sailfish OS, Plasma Active, and so on. The
bootloader uses kernel execution (kexec).
* **TWRP-Multirom** is a *recovery* which extends the capability of twrp to administrate 
secondary operating systems.

Build instructions: [wiki](https://github.com/gophix/android_device_asus_tf201t/wiki)

*Hint*: Originally the device is called TF201. This comes to into operation when the 
product.device property is read for verification, if the rom matches the
devices it was build for.
So some roms are not able to be installed, untill the device property is canged.
