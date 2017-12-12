# Inherit common AOKP stuff
$(call inherit-product, vendor/aokp/configs/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/dictionaries

$(call inherit-product, vendor/aokp/configs/telephony.mk)