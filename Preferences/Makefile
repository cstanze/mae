include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = MaePrefs

MaePrefs_FILES = $(wildcard *.m)
MaePrefs_FRAMEWORKS = UIKit
MaePrefs_PRIVATE_FRAMEWORKS = Preferences
MaePrefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
MaePrefs_INSTALL_PATH = /Library/PreferenceBundles
MaePrefs_CFLAGS = -fobjc-arc -I../headers -I../
MaePrefs_LDFLAGS = -w

include $(THEOS_MAKE_PATH)/bundle.mk
