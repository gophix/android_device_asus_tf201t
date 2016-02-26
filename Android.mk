LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),tf201t)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif

