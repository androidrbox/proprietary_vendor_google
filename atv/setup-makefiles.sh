#!/bin/bash

MAKEFILE=atv-vendor.mk
(cat << EOF) > $MAKEFILE
PRODUCT_PACKAGES += \\
EOF

cat proprietary-files.txt | awk -F: '{print "    "$1,"\\"}' >> $MAKEFILE

(cat << EOF) >> $MAKEFILE

PRODUCT_COPY_FILES += \\
    vendor/google/atv/misc/com.google.android.media.effects.jar:system/framework/com.google.android.media.effects.jar \\
    vendor/google/atv/misc/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar: \\
    vendor/google/atv/misc/com.google.android.media.effects.xml:system/etc/permissions/com.google.android.media.effects.xml \\
    vendor/google/atv/misc/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml

EOF

#######################################################################

MAKEFILE=Android.mk
(cat << EOF) > $MAKEFILE
LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),bueller)

EOF

#name:privileged:certificate:jni:overrides
#cat proprietary-files.txt | awk -F: '{
cat proprietary-files.txt | awk -F: '{
print "include $(CLEAR_VARS)"
print "LOCAL_MODULE :=", $1
print "LOCAL_PRIVILEGED_MODULE :=", $2
print "LOCAL_MODULE_TAGS := optional"
print "LOCAL_MODULE_CLASS := APPS"
print "LOCAL_SRC_FILES := app/$(LOCAL_MODULE).apk"
split($4,arr," ")
printf "LOCAL_PREBUILT_JNI_LIBS := "
for (i in arr)
    printf "lib/%s ", arr[i]
print "\nLOCAL_CERTIFICATE :=", $3
print "LOCAL_OVERRIDES_PACKAGES :=", $5
print "include $(BUILD_PREBUILT)"
print ""
#
}' >> $MAKEFILE

echo endif >> $MAKEFILE
