# Inherit common AOKP stuff
$(call inherit-product, vendor/aokp/config/common_full.mk)

PRODUCT_PACKAGES += AppDrawer

DEVICE_PACKAGE_OVERLAYS += vendor/aokp/overlay/tv
