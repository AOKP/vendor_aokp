# Exclude AudioFX
TARGET_EXCLUDES_AUDIOFX := true

# Inherit common AOKP stuff
$(call inherit-product, vendor/aokp/config/common_full.mk)


# Inherit Lineage atv device tree
$(call inherit-product, device/lineage/atv/lineage_atv.mk)

PRODUCT_PACKAGES += \
    AppDrawer \
    LineageCustomizer

DEVICE_PACKAGE_OVERLAYS += vendor/aokp/overlay/tv
