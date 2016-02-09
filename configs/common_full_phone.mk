# Inherit common AOKP stuff
$(call inherit-product, vendor/aokp/configs/common_full.mk)

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

#Set a default TWRP theme so that it builds
TW_THEME := portrait_hdpi

$(call inherit-product, vendor/aokp/configs/telephony.mk)
