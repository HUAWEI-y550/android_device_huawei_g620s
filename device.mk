#
# Copyright (C) 2015 Rudolf Tammekivi
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
#

DEVICE_PACKAGE_OVERLAYS += device/huawei/g620s/overlay

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Use standard dalvik heap sizes
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Graphics
PRODUCT_PACKAGES += \
	copybit.msm8916 \
	gralloc.msm8916 \
	hwcomposer.msm8916 \
	memtrack.msm8916

PRODUCT_PROPERTY_OVERRIDES += \
	debug.egl.hw=1 \
	debug.sf.hw=1 \
	debug.mdpcomp.logs=0 \
	persist.hwc.mdpcomp.enable=true \
	ro.opengles.version=196608 \
	ro.sf.lcd_density=320

# Init
PRODUCT_PACKAGES += \
	fstab.qcom \
	init.recovery.qcom.rc \
	init.qcom.rc \
	init.qcom.usb.rc \
	init.target.rc \
	ueventd.qcom.rc

# Include proprietary
$(call inherit-product, vendor/huawei/g620s/g620s-vendor.mk)
