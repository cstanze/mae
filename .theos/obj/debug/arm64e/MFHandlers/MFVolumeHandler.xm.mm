#line 1 "MFHandlers/MFVolumeHandler.xm"
#include "MFVolumeHandler.h"


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

@class AVSystemVolumeController; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$AVSystemVolumeController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("AVSystemVolumeController"); } return _klass; }
#line 3 "MFHandlers/MFVolumeHandler.xm"
@implementation MFVolumeHandler
-(void)actionWithFloatValue:(float)value {
    [[_logos_static_class_lookup$AVSystemVolumeController() volumeController] setTargetVolume:value];
}

-(float)floatResultFromAction {
    return [[_logos_static_class_lookup$AVSystemVolumeController() volumeController] volume];
}
@end
#line 12 "MFHandlers/MFVolumeHandler.xm"
