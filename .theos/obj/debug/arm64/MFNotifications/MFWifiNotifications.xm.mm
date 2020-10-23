#line 1 "MFNotifications/MFWifiNotifications.xm"
#import "../MFToggles/MFWifiToggle.h"


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

@class WFClient; 
static void (*_logos_orig$_ungrouped$WFClient$setPowered$)(_LOGOS_SELF_TYPE_NORMAL WFClient* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$WFClient$setPowered$(_LOGOS_SELF_TYPE_NORMAL WFClient* _LOGOS_SELF_CONST, SEL, BOOL); 

#line 3 "MFNotifications/MFWifiNotifications.xm"

static void _logos_method$_ungrouped$WFClient$setPowered$(_LOGOS_SELF_TYPE_NORMAL WFClient* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
    [[NSNotificationCenter defaultCenter] 
        postNotificationName:@"MFWifiPowerChange" 
        object:self];
    _logos_orig$_ungrouped$WFClient$setPowered$(self, _cmd, arg1);
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$WFClient = objc_getClass("WFClient"); { MSHookMessageEx(_logos_class$_ungrouped$WFClient, @selector(setPowered:), (IMP)&_logos_method$_ungrouped$WFClient$setPowered$, (IMP*)&_logos_orig$_ungrouped$WFClient$setPowered$);}} }
#line 11 "MFNotifications/MFWifiNotifications.xm"
