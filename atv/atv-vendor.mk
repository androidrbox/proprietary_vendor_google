PRODUCT_PACKAGES += \
    AndroidMediaShell \
    AtvCustomization \
    AtvRemoteService \
    Backdrop \
    CanvasCloudServices \
    CanvasPackageInstaller \
    FrameworkPackageStubs \
    FuguPairingTutorial \
    GamepadPairingService \
    GoogleContactsSyncAdapter \
    GoogleServicesFramework \
    LandscapeWallpaper \
    LeanbackIme \
    LeanbackLauncher \
    Music2Pano \
    NoTouchAuthDelegate \
    Overscan \
    PhoneskyKamikazeCanvas \
    PlayAutoInstallConfigFugu \
    PlayGames \
    PrebuiltGmsCorePano \
    RemoteControlService \
    SecondScreenSetup \
    SecondScreenSetupAuthBridge \
    SetupWraith \
    TV \
    TvVoiceInput \
    VideosPano \
    YouTubeLeanback \

PRODUCT_COPY_FILES += \
    vendor/google/atv/misc/com.google.android.media.effects.jar:system/framework/com.google.android.media.effects.jar \
    vendor/google/atv/misc/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar: \
    vendor/google/atv/misc/com.google.android.media.effects.xml:system/etc/permissions/com.google.android.media.effects.xml \
    vendor/google/atv/misc/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml

