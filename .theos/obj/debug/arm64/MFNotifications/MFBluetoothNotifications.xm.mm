#line 1 "MFNotifications/MFBluetoothNotifications.xm"
#import "../MFToggles/MFBluetoothToggle.h"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class BluetoothManager; 
static void (*_logos_orig$_ungrouped$BluetoothManager$_powerChanged)(_LOGOS_SELF_TYPE_NORMAL BluetoothManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$BluetoothManager$_powerChanged(_LOGOS_SELF_TYPE_NORMAL BluetoothManager* _LOGOS_SELF_CONST, SEL); 

#line 3 "MFNotifications/MFBluetoothNotifications.xm"

static void _logos_method$_ungrouped$BluetoothManager$_powerChanged(_LOGOS_SELF_TYPE_NORMAL BluetoothManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    [[NSNotificationCenter defaultCenter] 
        postNotificationName:@"MFBluetoothPowerChange" 
        object:self];
    _logos_orig$_ungrouped$BluetoothManager$_powerChanged(self, _cmd);
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$BluetoothManager = objc_getClass("BluetoothManager"); { MSHookMessageEx(_logos_class$_ungrouped$BluetoothManager, @selector(_powerChanged), (IMP)&_logos_method$_ungrouped$BluetoothManager$_powerChanged, (IMP*)&_logos_orig$_ungrouped$BluetoothManager$_powerChanged);}} }
#line 11 "MFNotifications/MFBluetoothNotifications.xm"
