# Copyright 2014 The Android Open Source Project
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

TARGET_KERNEL_CONFIG := aosp_kitakami_suzuran_defconfig

DEVICE_PACKAGE_OVERLAYS += \
    device/sony/suzuran/overlay

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, device/sony/kitakami/device.mk)
$(call inherit-product, vendor/sony/suzuran/suzuran-vendor.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/google/products/gms.mk)

PRODUCT_COPY_FILES += \
    device/sony/suzuran/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/sony/suzuran/rootdir/system/etc/BCM4356.hcd:system/etc/firmware/BCM43xx.hcd \
    device/sony/suzuran/rootdir/system/etc/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    device/sony/suzuran/rootdir/system/etc/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf \
    device/sony/suzuran/rootdir/system/etc/thermanager.xml:system/etc/thermanager.xml \
    device/sony/suzuran/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    device/sony/suzuran/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    device/sony/suzuran/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml

# Device Init
PRODUCT_PACKAGES += \
    init.recovery.suzuran \
    init.suzuran \
    ueventd.suzuran

# Lights
PRODUCT_PACKAGES += \
    lights.suzuran

# Simple PowerHAL
PRODUCT_PACKAGES += \
    power.suzuran

# NFC config
PRODUCT_PACKAGES += \
    nfc_nci.suzuran

PRODUCT_NAME := aosp_e5823
PRODUCT_DEVICE := suzuran
PRODUCT_MODEL := Xperia Z5 Compact (AOSP)
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320 \
    ro.usb.pid_suffix=1DA
