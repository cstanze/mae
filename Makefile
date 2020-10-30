INSTALL_TARGET_PROCESSES = SpringBoard
export ARCHS = arm64 arm64e
export TARGET = iphone:clang:13.3:13.0
# export PREFIX=$(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/
# If you have Xcode 12+ ^

include $(THEOS)/makefiles/common.mk

SUBPROJECTS += Tweak Preferences

include $(THEOS_MAKE_PATH)/aggregate.mk
