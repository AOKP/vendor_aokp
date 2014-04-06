$(call inherit-product, device/samsung/d2lte/full_d2lte.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Unified device flag for verizon permissions
VZW_UNIFIED := true

# Inherit common Verizon Wireless Perms and Lib
$(call inherit-product, vendor/aokp/configs/vzw.mk)

PRODUCT_DEVICE := d2lte
PRODUCT_NAME := aokp_d2lte
