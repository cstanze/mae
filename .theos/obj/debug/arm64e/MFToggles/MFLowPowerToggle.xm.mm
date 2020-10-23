#line 1 "MFToggles/MFLowPowerToggle.xm"
#import "MFLowPowerToggle.h"


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

@class PSLowPowerModeSettingsDetail; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$PSLowPowerModeSettingsDetail(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("PSLowPowerModeSettingsDetail"); } return _klass; }
#line 3 "MFToggles/MFLowPowerToggle.xm"
@implementation MFLowPowerToggle
-(void)toggleState {
    self.toggled = !self.toggled;
    [_logos_static_class_lookup$PSLowPowerModeSettingsDetail() setPowerMode:(self.toggled ? 1 : 0) error:nil];
}

-(void)offState {
    self.toggled = NO;
    [_logos_static_class_lookup$PSLowPowerModeSettingsDetail() setPowerMode:0 error:nil];
}

-(void)onState {
    self.toggled = YES;
    [_logos_static_class_lookup$PSLowPowerModeSettingsDetail() setPowerMode:1 error:nil];
}

-(BOOL)currentState {
    return [[NSProcessInfo processInfo] isLowPowerModeEnabled];
}

@end
#line 24 "MFToggles/MFLowPowerToggle.xm"
