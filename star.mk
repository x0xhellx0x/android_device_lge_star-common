-include $(LOCAL_PATH)/bootsplash/rle.mk

DEVICE_PACKAGE_OVERLAYS += device/lge/star-common/overlay

# The splashscreen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/initlogo.rle:root/initlogo.rle

# Board-specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init_recovery.rc:root/init_recovery.rc \
    $(LOCAL_PATH)/init.star.usb.rc:root/init.star.usb.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/egl.cfg:system/lib/egl/egl.cfg \
    $(LOCAL_PATH)/prebuilt/setup-recovery:system/bin/setup-recovery \
    $(LOCAL_PATH)/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    $(LOCAL_PATH)/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/nvodm_touch.idc:system/usr/idc/nvodm_touch.idc \
    $(LOCAL_PATH)/prebuilt/nvodm_touch.kl:system/usr/keylayout/nvodm_touch.kl \
    $(LOCAL_PATH)/prebuilt/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
    $(LOCAL_PATH)/prebuilt/tegra-kbc.kcm.bin:system/usr/keychars/tegra-kbc.kcm.bin \
    $(LOCAL_PATH)/prebuilt/qwerty.kl:system/usr/keylayout/qwerty.kl \
    $(LOCAL_PATH)/prebuilt/usb_keyboard_102_en_us.kl:system/usr/keylayout/usb_keyboard_102_en_us.kl \
    $(LOCAL_PATH)/prebuilt/usb_keyboard_102_en_us.kcm.bin:system/usr/keychars/usb_keyboard_102_en_us.kcm.bin

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# drm files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/drm/libdrmwvmplugin.so:system/lib/drm/libdrmwvmplugin.so \
    $(LOCAL_PATH)/drm/libwvdrm_L3.so:system/lib/libwvdrm_L3.so \
    $(LOCAL_PATH)/drm/libwvm.so:system/lib/libwvm.so \
    $(LOCAL_PATH)/drm/libWVStreamControlAPI_L3.so:system/lib/libWVStreamControlAPI_L3.so 

# init.d files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.d/98zram:system/etc/init.d/98zram \
    $(LOCAL_PATH)/init.d/99tune:system/etc/init.d/99tune

PRODUCT_PROPERTY_OVERRIDES += \
        ro.opengles.version=131072 \
        ro.telephony.call_ring.multiple=false \
        ro.telephony.call_ring.delay=3000 \
        ro.telephony.call_ring.absent=true \
        ro.telephony.ril_class=LGEStarRIL \
        ro.hardware.respect_als=true \
        ro.bt.bdaddr_path=/sys/devices/platform/star_bd_address/bdaddr_if \
	debug.sf.electron_frames=42 \
	ro.telephony.ril.v3=facilitylock,datacall,signalstrength,icccardstatus,singlepdp \
	dalvik.vm.dexopt-data-only=1

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product, build/target/product/full_base_telephony.mk)

PRODUCT_LOCALES += hdpi

## LGE stuffs
PRODUCT_PACKAGES += \
    LGEServices \
    Torch \
    bridgeutil \
    libbridges \
    libbridge \
    libbridge_jni \
    secureclockd \
    libsecureclock \
    screencap \
    hwprops \
    HwaSettings \
    audio.a2dp.default \
    camera.tegra \
    hwcomposer.default \
    com.android.future.usb.accessory

# Set default USB interface
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_MANUFACTURER := LGE
