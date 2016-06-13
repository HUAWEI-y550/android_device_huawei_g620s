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

# Audio
PRODUCT_PACKAGES += \
	audio_policy.conf \
	mixer_paths_qrd_skuh.xml \
	audio.a2dp.default \
	audio.primary.msm8916 \
	audio.r_submix.default \
	audio.usb.default

PRODUCT_PROPERTY_OVERRIDES += \
	audio.offload.buffer.size.kb=64 \
	audio.offload.min.duration.secs=30 \
	av.offload.enable=true

# ANT+ stack
PRODUCT_PACKAGES += \
	AntHalService \
	libantradio \
	antradio_app \
	com.dsi.ant.antradio_library

# Charger
PRODUCT_PACKAGES += \
	charger_res_images

# FM
PRODUCT_PACKAGES += \
	FM2 \
	FMRecord \
	libqcomfm_jni \
	qcom.fmradio

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
	ro.sf.lcd_density=240

# Init
PRODUCT_PACKAGES += \
	fstab.qcom \
	init.recovery.qcom.rc \
	init.qcom.rc \
	init.qcom.power.rc \
	init.qcom.usb.rc \
	init.target.rc \
	ueventd.qcom.rc

# IPC Security Conf
PRODUCT_PACKAGES += \
	sec_config

# Lights
PRODUCT_PACKAGES += \
	lights.msm8916

# Media
PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_PACKAGES += \
	libdivxdrmdecrypt \
	libmm-omxcore \
	libOmxCore \
	libOmxVdec \
	libOmxVenc \
	libOmxAacEnc \
	libOmxAmrEnc \
	libOmxEvrcEnc \
    	libOmxQcelp13Enc \
	libOmxVdecHevc \
	libstagefrighthw \
	media_codecs.xml

# NFC
PRODUCT_BOOT_JARS += \
	com.android.nfc.helper \
	com.android.qcom.nfc_extras

PRODUCT_PACKAGES += \
	nfc-nci.conf \
	Tag

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
	packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt

# Permissions
PRODUCT_COPY_FILES += \
	external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Power
PRODUCT_PACKAGES += \
	power.msm8916

# RIL
PRODUCT_PACKAGES += \
	liboeminfo_oem_api \
	libbson \
	libxml2

PRODUCT_PROPERTY_OVERRIDES += \
	persist.radio.apm_sim_not_pwdn=1 \
	persist.radio.force_nw_search=1 \
	persist.radio.use_nv_force=false \
	persist.radio.rat_on=combine \
	persist.radio.no_wait_for_card=1 \
	rild.libpath=/vendor/lib/libril-qc-qmi-1.so \
	rild.libargs=-d/dev/smd0

# Sensors
PRODUCT_PACKAGES += \
	calmodule.cfg \
	libcalmodule_common \
	sensors.msm8916

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    	com.android.future.usb.accessory \
	persist.sys.usb.config=mtp

# USB OTG
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.isUsbOtgEnabled=1

# Wi-Fi
PRODUCT_PACKAGES += \
	libqsap_sdk \
	libQWiFiSoftApCfg \
	libwpa_client \
	hostapd \
	WCNSS_cfg.dat \
	WCNSS_qcom_cfg.ini \
	WCNSS_qcom_wlan_nv.bin \
	wcnss_service \
	wpa_supplicant \
	wpa_supplicant.conf \
	wpa_supplicant_overlay.conf

# Ebtables
PRODUCT_PACKAGES += \
	ebtables \
	ethertypes \
	libebtc

# Include proprietary
$(call inherit-product, vendor/huawei/g620s/g620s-vendor.mk)
