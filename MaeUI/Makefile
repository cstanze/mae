# TARGET := iphone:clang:14.0:13.0

include $(THEOS)/makefiles/common.mk

FRAMEWORK_NAME = MaeUI

MaeUI_FILES = $(wildcard *.m) $(wildcard *.xm) $(wildcard Modules/*.xm)
MaeUI_PUBLIC_HEADERS = $(wildcard *.h) $(wildcard Modules/*.h)
# MaeUI_PRIVATE_FRAMEWORKS = MaterialKit
MaeUI_EXTRA_FRAMEWORKS = Cephei MaeCommon MaeServices
MaeUI_INSTALL_PATH = /Library/Frameworks
MaeUI_CFLAGS = -fobjc-arc -I../headers -I../
MaeUI_LDFLAGS += -F../.theos/$(THEOS_OBJ_DIR_NAME) -w

include $(THEOS_MAKE_PATH)/framework.mk
