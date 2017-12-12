# Inherit common AOKP stuff
$(call inherit-product, vendor/aokp/configs/common.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder

# SwagPapers
PRODUCT_PACKAGES += \
    SwagPapers
