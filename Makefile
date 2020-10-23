export ARCHS = arm64 arm64e
export TARGET = iphone:clang:13.3:13.0
# export PREFIX=$(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/
# If you have Xcode 12+ ^
# export THEOS_DEVICE_IP = 192.168.1.248

include $(THEOS)/makefiles/common.mk

SUBPROJECTS += Tweak Preferences

include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
