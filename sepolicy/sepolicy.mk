BOARD_SEPOLICY_DIRS += \
    vendor/aokp/sepolicy

BOARD_SEPOLICY_UNION += \
    file.te \
    file_contexts \
    fs_use \
    genfs_contexts \
    seapp_contexts \
    installd.te \
    netd.te \
    ueventd.te \
    vold.te \
    mac_permissions.xml
