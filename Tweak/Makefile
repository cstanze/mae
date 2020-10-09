include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Mae
Mae_FILES = Mae.xm $(wildcard MFNotifications/*.xm) $(wildcard MFHandlers/*.xm) $(wildcard MFToggles/*.xm) $(wildcard MFCommon/*.m) $(wildcard MFViews/*.m) $(wildcard MFViewControllers/*.m)
Mae_FRAMEWORKS = UIKit
Mae_PRIVATE_FRAMEWORKS = BackBoardServices
Mae_EXTRA_FRAMEWORKS = Cephei
Mae_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
