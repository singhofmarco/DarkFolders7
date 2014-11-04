export ARCHS = armv7 arm64
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 7.1
TARGET_IPHONEOS_DEPLOYMENT_VERSION_arm64 = 7.1
SDKVERSION = 7.1

include theos/makefiles/common.mk

TWEAK_NAME = DarkFolders7
DarkFolders7_FILES = Tweak.xm
DarkFolders7_FRAMEWORKS = Foundation, UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += darkfolders7settings
include $(THEOS_MAKE_PATH)/aggregate.mk
