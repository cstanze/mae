TARGET := iphone:clang:14.0:13.0

include $(THEOS)/makefiles/common.mk

FRAMEWORK_NAME = MaeUI

MaeUI_FILES = $(wildcard *.m)
MaeUI_PUBLIC_HEADERS = $(wildcard *.h)
MaeUI_EXTRA_FRAMEWORKS = MaeCommon MaeServices
MaeUI_INSTALL_PATH = /Library/Frameworks
MaeUI_CFLAGS = -fobjc-arc -I../headers -I../
MaeUI_LDFLAGS += -F../.theos/$(THEOS_OBJ_DIR_NAME) -w

include $(THEOS_MAKE_PATH)/framework.mk
