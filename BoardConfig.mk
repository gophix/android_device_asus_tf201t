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

LOCAL_PATH := device/asus/tf300t

TARGET_BUILD_PDK := false
WITHOUT_CHECK_API := true
WITHOUT_CLANG := true
WITHOUT_LIBCOMPILER_RT := true

# Board naming
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := cardhu
TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM := tegra

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
ARCH_ARM_USE_NON_NEON_MEMCPY := true

NEED_WORKAROUND_CORTEX_A9_745320 := true

# Support both new and old property system
BUILD_OLD_SYS_PROPS := true
COMMON_GLOBAL_CFLAGS += -DBUILD_OLD_SYS_PROPS

# Kernel sources
TARGET_KERNEL_SOURCE := kernel/asus/tf300t
TARGET_KERNEL_CONFIG := tf300t_mrom_defconfig

# Boot/Recovery image settings
BOARD_KERNEL_CMDLINE  :=
BOARD_KERNEL_BASE     := 0x10000000
BOARD_KERNEL_PAGESIZE :=
BOARD_MKBOOTIMG_ARGS := --board "mrom$(shell date +%Y%m%d)"

# Misc display settings
BOARD_USE_SKIA_LCDTEXT := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true

# Support for dock battery
TARGET_HAS_DOCK_BATTERY := true

# Misc flags
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 29850022707
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

PRODUCT_COPY_FILES +=  \
	$(LOCAL_PATH)/ramdisk/init.cardhu.rc:root/init.cardhu.rc \
	$(LOCAL_PATH)/ramdisk/init.tf.rc:root/init.tf.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.cardhu.rc:root/ueventd.cardhu.rc \
	$(LOCAL_PATH)/ramdisk/init.cardhu.usb.rc:root/init.cardhu.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.cardhu.cpu.rc:root/init.cardhu.cpu.rc \
	$(LOCAL_PATH)/ramdisk/fstab.cardhu:root/fstab.cardhu \
	$(LOCAL_PATH)/twrp/twrp.fstab:recovery/root/etc/twrp.fstab  \
	$(LOCAL_PATH)/twrp/twrp.fstab:recovery/root/etc/twrp.fstab

# TWRP
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/twrp/recovery.mk
TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/twrp/init.rc
TWRP_CUSTOM_KEYBOARD := ../../../$(LOCAL_PATH)/twrp/hardwarekeyboard.cpp

DEVICE_RESOLUTION := 1280x800
BOARD_NEEDS_LZMA_MINIGZIP := true
BOARD_HAS_LARGE_FILESYSTEM := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true

TW_NO_USB_STORAGE := true
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_REBOOT_RECOVERY := true
TW_INCLUDE_JB_CRYPTO := true

TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sdcard"

TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/mmcblk0p8"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "data=ordered,delalloc"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"

# MultiROM (MultiROM also uses parts of TWRP config)
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := $(LOCAL_PATH)/mrom/mr_init_devices.c
#MR_DPI := mdpi
MR_DPI := hdpi
MR_FSTAB := $(LOCAL_PATH)/twrp/twrp.fstab
MR_KEXEC_MEM_MIN := 0x84000000
#MR_INFOS := $(LOCAL_PATH)/mrom/infos

