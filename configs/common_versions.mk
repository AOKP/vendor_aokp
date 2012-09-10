# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=JRO03H BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

DATE = $(shell date +%h-%d-%y)

#Define Nightly Build
ifdef AOKP_NIGHTLY
PRODUCT_PROPERTY_OVERRIDES += \
    ro.aokp.version=$(TARGET_PRODUCT)_jb-${DATE}
# Goo updater app
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.developerid=aokp \
    ro.goo.board=$(TARGET_PRODUCT)
    ro.goo.rom=aokp \
    ro.goo.version=$(DATE)
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.aokp.version=$(TARGET_PRODUCT)_jb-build-1
# Goo updater app
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.developerid=aokp \
    ro.goo.rom=aokp \
    ro.goo.version=21
endif

# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.camera-sound=1
