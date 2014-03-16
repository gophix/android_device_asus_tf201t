
TF_BLOBIFIER := $(HOST_OUT_EXECUTABLES)/blobpack_tfp

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(TF_BLOBIFIER) \
		$(recovery_kernel)
	@echo ----- Making recovery image ------
	$(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) --board "RCmrom$(shell date +%Y%m%d)" --output $@.orig
	$(TF_BLOBIFIER) $@ SOS $@.orig
	@echo ----- Made recovery image -------- $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)

