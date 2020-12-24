TARGET := iphone:clang:14.0:13.0

include $(THEOS)/makefiles/common.mk

FRAMEWORK_NAME = MaeCommon

MaeCommon_FILES = $(wildcard *.m)
MaeCommon_EXTRA_FRAMEWORKS = Cephei MaeServices
MaeCommon_PUBLIC_HEADERS = $(wildcard *.h) $(wildcard *.hh)
MaeCommon_INSTALL_PATH = /Library/Frameworks
MaeCommon_CFLAGS = -fobjc-arc -I../headers 
MaeCommon_LDFLAGS += -F../.theos/$(THEOS_OBJ_DIR_NAME) -w

include $(THEOS_MAKE_PATH)/framework.mk
