# Inherit common AOKP stuff
$(call inherit-product, vendor/aokp/configs/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME
