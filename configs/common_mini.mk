# Inherit common CM stuff
$(call inherit-product, vendor/aokp/configs/common.mk)

PRODUCT_SIZE := mini

# Include CM audio files
include vendor/aokp/configs/cm_audio.mk


