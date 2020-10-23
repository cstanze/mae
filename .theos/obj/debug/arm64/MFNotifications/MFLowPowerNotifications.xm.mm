#line 1 "MFNotifications/MFLowPowerNotifications.xm"
#import "../MFToggles/MFLowPowerToggle.h"


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

@class BCBatteryDevice; 
static void (*_logos_orig$_ungrouped$BCBatteryDevice$setLowPower$)(_LOGOS_SELF_TYPE_NORMAL BCBatteryDevice* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$BCBatteryDevice$setLowPower$(_LOGOS_SELF_TYPE_NORMAL BCBatteryDevice* _LOGOS_SELF_CONST, SEL, BOOL); 

#line 3 "MFNotifications/MFLowPowerNotifications.xm"

static void _logos_method$_ungrouped$BCBatteryDevice$setLowPower$(_LOGOS_SELF_TYPE_NORMAL BCBatteryDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
    [[NSNotificationCenter defaultCenter] 
        postNotificationName:@"MFLowPowerModeChange" 
        object:self];
    _logos_orig$_ungrouped$BCBatteryDevice$setLowPower$(self, _cmd, arg1);
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$BCBatteryDevice = objc_getClass("BCBatteryDevice"); { MSHookMessageEx(_logos_class$_ungrouped$BCBatteryDevice, @selector(setLowPower:), (IMP)&_logos_method$_ungrouped$BCBatteryDevice$setLowPower$, (IMP*)&_logos_orig$_ungrouped$BCBatteryDevice$setLowPower$);}} }
#line 11 "MFNotifications/MFLowPowerNotifications.xm"
