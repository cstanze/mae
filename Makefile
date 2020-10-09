export ARCHS = arm64 arm64e
export THEOS_DEVICE_IP = 192.168.1.248

include $(THEOS)/makefiles/common.mk

SUBPROJECTS += Tweak Preferences

include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
