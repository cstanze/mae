#line 1 "MFToggles/MFAirplaneToggle.xm"
#include "MFAirplaneToggle.h"


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

@class SBAirplaneModeController; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBAirplaneModeController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBAirplaneModeController"); } return _klass; }
#line 3 "MFToggles/MFAirplaneToggle.xm"
@implementation MFAirplaneToggle
-(void)toggleState {
    self.toggled = ![[_logos_static_class_lookup$SBAirplaneModeController() sharedInstance] isInAirplaneMode];
    [[_logos_static_class_lookup$SBAirplaneModeController() sharedInstance] setInAirplaneMode:self.toggled];
    [[_logos_static_class_lookup$SBAirplaneModeController() sharedInstance] airplaneModeChanged];
}

-(void)offState {
    [[_logos_static_class_lookup$SBAirplaneModeController() sharedInstance] setInAirplaneMode:NO];
    [[_logos_static_class_lookup$SBAirplaneModeController() sharedInstance] airplaneModeChanged];
    self.toggled = NO;
}

-(void)onState {
    [[_logos_static_class_lookup$SBAirplaneModeController() sharedInstance] setInAirplaneMode:YES];
    [[_logos_static_class_lookup$SBAirplaneModeController() sharedInstance] airplaneModeChanged];
    self.toggled = YES;
}

-(BOOL)currentState {
    return [[_logos_static_class_lookup$SBAirplaneModeController() sharedInstance] isInAirplaneMode];
}
@end
#line 26 "MFToggles/MFAirplaneToggle.xm"
