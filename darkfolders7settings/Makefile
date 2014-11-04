export ARCHS = armv7 arm64
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 7.1
TARGET_IPHONEOS_DEPLOYMENT_VERSION_arm64 = 7.1
SDKVERSION = 7.1


include theos/makefiles/common.mk

BUNDLE_NAME = darkfolders7settings
darkfolders7settings_FILES = darkfolders7settings.mm
darkfolders7settings_INSTALL_PATH = /Library/PreferenceBundles
darkfolders7settings_FRAMEWORKS = UIKit
darkfolders7settings_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/darkfolders7settings.plist$(ECHO_END)
