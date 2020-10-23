#line 1 "MFHandlers/MFBrightnessHandler.xm"
#include "MFBrightnessHandler.h"


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

@class SBBrightnessController; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBBrightnessController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBBrightnessController"); } return _klass; }
#line 3 "MFHandlers/MFBrightnessHandler.xm"
@implementation MFBrightnessHandler
-(void)actionWithFloatValue:(float)value {
    [[_logos_static_class_lookup$SBBrightnessController() sharedBrightnessController] _setBrightnessLevel:value showHUD:NO];
}

-(float)floatResultFromAction {
    return [[UIScreen mainScreen] brightness];
}
@end
#line 12 "MFHandlers/MFBrightnessHandler.xm"
