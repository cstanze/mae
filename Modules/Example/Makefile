# TARGET := iphone:clang:14.0:13.0

include $(THEOS)/makefiles/common.mk

FRAMEWORK_NAME = MFExampleModule

MFExampleModule_FILES = ExampleModule.m
MFExampleModule_FRAMEWORKS = UIKit
MFExampleModule_PRIVATE_FRAMEWORKS = Preferences
MFExampleModule_INSTALL_PATH = /Library/Mae
MFExampleModule_CFLAGS = -fobjc-arc
MFExampleModule_LDFLAGS = -w

include $(THEOS_MAKE_PATH)/framework.mk
