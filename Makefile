TARGET := iphone:clang:13.0:14.0

include $(THEOS)/makefiles/common.mk

FRAMEWORK_NAME = AlexandraUI

AlexandraUI_FILES = $(wildcard *.m) $(wildcard *.mm)
AlexandraUI_PUBLIC_HEADERS = $(wildcard *.h) $(wildcard *.hh)
AlexandraUI_INSTALL_PATH = /Library/Frameworks
AlexandraUI_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/framework.mk
