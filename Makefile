INSTALL_TARGET_PROCESSES = SpringBoard
export ARCHS = arm64 arm64e
export TARGET = iphone:clang:14.0:13.0 # Only if needed
export PREFIX = $(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/
# Xcode 12+ ^

include $(THEOS)/makefiles/common.mk

# the juicy parts...
SUBPROJECTS += MaeServices
SUBPROJECTS += MaeCommon
SUBPROJECTS += MaeUI
SUBPROJECTS += SpringBoard
SUBPROJECTS += Preferences

include $(THEOS_MAKE_PATH)/aggregate.mk
