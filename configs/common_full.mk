# Inherit common AOKP stuff
$(call inherit-product, vendor/aokp/configs/common.mk)

# Bring in all video files
$(call inherit-product, frameworks/base/data/videos/VideoPackage2.mk)

PRODUCT_SIZE := full

# Include AOKP LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/dictionaries

PRODUCT_PACKAGES += \
    VideoEditor \
    libvideoeditor_jni \
    libvideoeditor_core \
    libvideoeditor_osal \
    libvideoeditor_videofilters \
    libvideoeditorplayer

# Themes
#PRODUCT_PACKAGES += \
    #HexoLibre

# Recorder
PRODUCT_PACKAGES += \
    Recorder

# SwagPapers
PRODUCT_PACKAGES += \
    SwagPapers