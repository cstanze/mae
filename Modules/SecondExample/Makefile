# TARGET := iphone:clang:14.0:13.0

include $(THEOS)/makefiles/common.mk

FRAMEWORK_NAME = MFSecondExampleModule

MFSecondExampleModule_FILES = SecondExampleModule.m
MFSecondExampleModule_FRAMEWORKS = UIKit
MFSecondExampleModule_PRIVATE_FRAMEWORKS = Preferences
MFSecondExampleModule_INSTALL_PATH = /Library/Mae
MFSecondExampleModule_CFLAGS = -fobjc-arc
MFSecondExampleModule_LDFLAGS = -w

include $(THEOS_MAKE_PATH)/framework.mk
