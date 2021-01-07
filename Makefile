INSTALL_TARGET_PROCESSES = SpringBoard
export ARCHS = arm64 arm64e
export THEOS_DEVICE_IP = 10.0.1.4 # Home
# export THEOS_DEVICE_IP = 172.20.10.1 # Hotspot
# export THEOS_DEVICE_IP = 192.168.1.168 # Other
export TARGET = iphone:clang:14.0:13.0 # Constanze Only
export PREFIX=$(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/
# Xcode 12+ ^
export MF_USE_DRM = 0 # 1 for DRM compilation, 0 to skip DRM

include $(THEOS)/makefiles/common.mk

# the juicy parts...
SUBPROJECTS += MaeServices
SUBPROJECTS += MaeCommon
SUBPROJECTS += MaeUI
SUBPROJECTS += SpringBoard
SUBPROJECTS += Preferences
ifeq (MF_USE_DRM,1)
# TODO: Finish Akari
# SUBPROJECTS += Akari
endif

include $(THEOS_MAKE_PATH)/aggregate.mk
