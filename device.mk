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

# Device path
DEVICE_PATH := device/sony/suzuran

DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

PRODUCT_COPY_FILES := \
    $(DEVICE_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(DEVICE_PATH)/rootdir/system/etc/BCM43455.hcd:system/etc/firmware/BCM43xx.hcd \
    $(DEVICE_PATH)/rootdir/system/etc/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    $(DEVICE_PATH)/rootdir/system/etc/sensors/sensor_def_qcomdev.conf:system/etc/sensors/sensor_def_qcomdev.conf \
    $(DEVICE_PATH)/rootdir/system/etc/thermanager.xml:system/etc/thermanager.xml \
    $(DEVICE_PATH)/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(DEVICE_PATH)/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml

# Audio Calibration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Bluetooth_cal.acdb:system/etc/acdbdata/Bluetooth_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/General_cal.acdb:system/etc/acdbdata/General_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Global_cal.acdb:system/etc/acdbdata/Global_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Handset_cal.acdb:system/etc/acdbdata/Handset_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Hdmi_cal.acdb:system/etc/acdbdata/Hdmi_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Headset_cal.acdb:system/etc/acdbdata/Headset_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Speaker_cal.acdb:system/etc/acdbdata/Speaker_cal.acdb

# Device Specific Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml

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

# Fingerprint HAL
PRODUCT_PACKAGES += \
    fingerprintd \
    fingerprint.suzuran

# NFC config
PRODUCT_PACKAGES += \
    nfc_nci.suzuran

# Telephony Packages (AOSP)
PRODUCT_PACKAGES += \
    InCallUI \
    Stk

# SAR
PRODUCT_PACKAGES += \
    TransPowerSensors

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=320 \
    ro.usb.pid_suffix=1DA

## 8MP Switch for ES
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.8mp.config=true

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/kitakami/platform.mk)
$(call inherit-product, vendor/sony/kitakami-suzuran/suzuran-vendor.mk)

# copy wlan firmware
$(call inherit-product-if-exists, vendor/broadcom/wlan/bcmdhd/firmware/bcm43455/device-bcm-vendor.mk)

# copy NFC firmware
$(call inherit-product-if-exists, vendor/nxp/nxp-vendor.mk)
