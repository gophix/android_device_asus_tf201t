#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := device/asus/tf201t

TARGET_BUILD_PDK := false
WITHOUT_CHECK_API := true
WITHOUT_CLANG := true
WITHOUT_LIBCOMPILER_RT := true

# Board naming
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := cardhu
TARGET_BOARD_PLATFORM := tegra3
TARGET_TEGRA_VERSION := t30
# TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true

ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
ARCH_ARM_USE_NON_NEON_MEMCPY := true

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true
# Misc flags
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Kernel sources
TARGET_KERNEL_SOURCE := kernel/asus/tf201t
TARGET_KERNEL_CONFIG := tf201t_mrom_defconfig
# TARGET_KERNEL_SOURCE := kernel/asus/tegra3/unified/
# TARGET_KERNEL_CONFIG := grimlock_tegra3_defconfig

BOARD_KERNEL_CMDLINE  := console=tty0 loglevel=3
BOARD_KERNEL_BASE     := 0x10000000
BOARD_KERNEL_PAGESIZE :=
BOARD_MKBOOTIMG_ARGS := --board "mrom$(shell date +%Y%m%d)"

# EGL settings
BOARD_EGL_NEEDS_LEGACY_FB := true
BOARD_EGL_CFG := device/asus/tf201/prebuilt/egl.cfg
USE_OPENGL_RENDERER := true

# Misc display settings
BOARD_USE_SKIA_LCDTEXT := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true

# Bluetooth
# BOARD_HAVE_BLUETOOTH := true
# BOARD_HAVE_BLUETOOTH_BCM := true
# BOARD_BLUEDROID_VENDOR_CONF := device/asus/tf201/bluetooth/vnd_tf201.txt
# BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/asus/tf201/bluetooth

# Wifi related defines
# BOARD_WPA_SUPPLICANT_DRIVER := NL80211
# WPA_SUPPLICANT_VERSION := VER_0_8_X
# BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
# BOARD_HOSTAPD_DRIVER := NL80211
# BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
# BOARD_WLAN_DEVICE := bcmdhd
# WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
# WIFI_DRIVER_FW_PATH_STA := "/system/vendor/firmware/fw_bcmdhd.bin"
# WIFI_DRIVER_FW_PATH_P2P := "/system/vendor/firmware/fw_bcmdhd_p2p.bin"
# WIFI_DRIVER_FW_PATH_AP := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"

# Support for dock battery
TARGET_HAS_DOCK_BATTERY := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 29850022707
BOARD_FLASH_BLOCK_SIZE := 4096

PRODUCT_COPY_FILES +=  \
	$(LOCAL_PATH)/ramdisk/init.cardhu.rc:root/init.cardhu.rc \
	$(LOCAL_PATH)/ramdisk/init.cardhu.usb.rc:root/init.cardhu.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.cardhu.cpu.rc:root/init.cardhu.cpu.rc \
	$(LOCAL_PATH)/ramdisk/init.tf.rc:root/init.tf.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.cardhu.rc:root/ueventd.cardhu.rc \
	$(LOCAL_PATH)/ramdisk/fstab.cardhu:root/fstab.cardhu \
	$(LOCAL_PATH)/recovery/init.recovery.usb.rc:root/init.recovery.usb.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.cardhu.rc:root/ueventd.cardhu.rc \
	$(LOCAL_PATH)/twrp/twrp.fstab:recovery/root/etc/twrp.fstab

	
# *** TWRP ***
TARGET_RECOVERY_IS_MULTIROM := true
TW_EXCLUDE_SUPERSU := true

TW_THEME := landscape_hdpi
DEVICE_RESOLUTION := 1280x800
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_NO_USB_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sdcard"
TW_BRIGHTNESS_PATH := /sys/devices/platform/pwm-backlight/backlight/pwm-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"

BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/twrp/recovery.mk
BOARD_NEEDS_LZMA_MINIGZIP := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_SDCARD_INTERNAL := true

TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/recovery/init.rc
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_REBOOT_RECOVERY := false

TW_INCLUDE_JB_CRYPTO := false
TW_INCLUDE_CRYPTO := false
# TW_CRYPTO_FS_TYPE := "f2fs"
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/mmcblk0p8"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "data=ordered,delalloc"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"
# TWRP_CUSTOM_KEYBOARD := ../../../$(LOCAL_PATH)/twrp/hardwarekeyboard.cpp


# *** MultiROM *** (MultiROM also uses parts of TWRP config)
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := $(LOCAL_PATH)/mr/mr_init_devices.c
MR_DPI := hdpi
# MR_DPI_FONT := 216
MR_USE_MROM_FSTAB := true
MR_FSTAB := $(LOCAL_PATH)/twrp/twrp.fstab
MR_KEXEC_MEM_MIN := 0x84000000
MR_DEFAULT_BRIGHTNESS := 40
MR_DEVICE_HOOKS_VER := 3
MR_DEVICE_HOOKS := $(LOCAL_PATH)/mr/mr_hooks.c
# MR_INFOS := $(LOCAL_PATH)/mr/infos
# MR_ENCRYPTION := true
