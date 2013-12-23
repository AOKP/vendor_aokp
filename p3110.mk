# Copyright (C) 2012 ParanoidAndroid Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)


# Inherit AOSP device configuration
$(call inherit-product, device/samsung/p3110/full_p3110.mk)

# Override AOSP build properties
PRODUCT_NAME := aokp_p3110
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-P3110
PRODUCT_MANUFACTURER := samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=espressowifixx TARGET_DEVICE=espressowifi BUILD_FINGERPRINT="samsung/espressowifixx/espressowifi:4.0.3/IML74K/P3110XWALD2"
PRIVATE_BUILD_DESC="espressowifixx-user 4.0.3 IML74K P3110XWALD2 release-keys"

PRODUCT_RELEASE_NAME := GT-P3110

