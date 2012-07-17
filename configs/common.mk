$(call inherit-product-if-exists, vendor/aokp/prebuilt/prebuilts.mk)

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/common

# T-Mobile theme engine
# include vendor/aokp/configs/themes_common.mk

PRODUCT_PACKAGES += \
    MusicFX \
    MusicVisualization \
    NoiseField \
    ROMControl \
    PhaseBeam \
    su \
    AppWidgetPicker \
    openvpn \
    SwagPapers \
    AOKPtips \
    Superuser

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.feedback \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enterprise_mode=1 \
    windowsmgr.max_events_per_sec=240 \
    ro.kernel.android.checkjni=0

# Inherit common build.prop overrides
-include vendor/aokp/configs/common_versions.mk
