# Adding files needed for extra camera features
PRODUCT_PACKAGES := \
    AndroidInSpace.240p \
    AndroidInSpace.480p \
    Disco.240p \
    Disco.480p \
    Sunset240p \
    Sunset480p \
    LMprec_508 \
    PFFprec_600

$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit drm blobs
-include vendor/aokp/configs/common_drm_phone.mk

