include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Mae
Mae_FILES = $(wildcard *.m) $(wildcard *.xm)
Mae_FRAMEWORKS = UIKit AudioToolbox
# Mae_PRIVATE_FRAMEWORKS = BackBoardServices ControlCenterServices
Mae_EXTRA_FRAMEWORKS = Cephei MaeUI MaeServices MaeCommon
Mae_CFLAGS = -fobjc-arc -I../headers -I../
Mae_LDFLAGS += -F../.theos/$(THEOS_OBJ_DIR_NAME) -w

include $(THEOS_MAKE_PATH)/tweak.mk