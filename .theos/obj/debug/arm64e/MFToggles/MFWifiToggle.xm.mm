#line 1 "MFToggles/MFWifiToggle.xm"
#include "MFWifiToggle.h"


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

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WFClient(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WFClient"); } return _klass; }
#line 3 "MFToggles/MFWifiToggle.xm"
@implementation MFWifiToggle
-(void)toggleState {
    self.toggled = ![[_logos_static_class_lookup$WFClient() sharedInstance] powered];
    [[_logos_static_class_lookup$WFClient() sharedInstance] setPowered:self.toggled];
}

-(void)offState {
    self.toggled = NO;
    [[_logos_static_class_lookup$WFClient() sharedInstance] setPowered:NO];
}

-(void)onState {
    self.toggled = YES;
    [[_logos_static_class_lookup$WFClient() sharedInstance] setPowered:YES];
}

-(BOOL)currentState {
    return [[_logos_static_class_lookup$WFClient() sharedInstance] powered];
}
@end
#line 23 "MFToggles/MFWifiToggle.xm"
