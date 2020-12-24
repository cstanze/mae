TARGET := iphone:clang:14.0:13.0

include $(THEOS)/makefiles/common.mk

FRAMEWORK_NAME = MaeServices

MaeServices_FILES = $(wildcard *.m) $(wildcard *.xm)
MaeServices_PUBLIC_HEADERS = $(wildcard *.h)
MaeServices_EXTRA_FRAMEWORKS = Cephei
MaeServices_INSTALL_PATH = /Library/Frameworks
MaeServices_CFLAGS = -fobjc-arc -I../headers -I../
MaeServices_LDFLAGS += -F../.theos/$(THEOS_OBJ_DIR_NAME) -w

include $(THEOS_MAKE_PATH)/framework.mk
