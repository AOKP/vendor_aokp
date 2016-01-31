# Inherit common AOKP stuff
$(call inherit-product, vendor/aokp/configs/common.mk)

# Include AOKP audio files
include vendor/aokp/config/cm_audio.mk

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg
