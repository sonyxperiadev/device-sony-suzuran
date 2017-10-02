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

include device/sony/kitakami/PlatformConfig.mk

TARGET_BOOTLOADER_BOARD_NAME := E5823

BOARD_KERNEL_CMDLINE += androidboot.hardware=suzuran

# Platform
PRODUCT_PLATFORM := kitakami

# Recovery config
BOARD_SONY_INIT_FLAGS += -DDEV_BLOCK_FOTA_NUM="32"
BOARD_SONY_INIT_FLAGS += -DDEV_BLOCK_FOTA_MAJOR="259"
BOARD_SONY_INIT_FLAGS += -DDEV_BLOCK_FOTA_MINOR="0"

TARGET_TAP_TO_WAKE_NODE := "/sys/devices/virtual/input/clearpad/wakeup_gesture"
