#line 1 "MFToggles/MFBluetoothToggle.xm"
#import "MFBluetoothToggle.h"











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

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$BluetoothManager(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("BluetoothManager"); } return _klass; }
#line 12 "MFToggles/MFBluetoothToggle.xm"
@implementation MFBluetoothToggle
-(void)toggleState {
    self.toggled = !self.toggled;
    [[_logos_static_class_lookup$BluetoothManager() sharedInstance] setPowered:self.toggled];
    [[_logos_static_class_lookup$BluetoothManager() sharedInstance] _powerChanged];
}

-(void)offState {
    self.toggled = NO;
    [[_logos_static_class_lookup$BluetoothManager() sharedInstance] setPowered:NO];
    [[_logos_static_class_lookup$BluetoothManager() sharedInstance] _powerChanged];
}

-(void)onState {
    self.toggled = YES;
    [[_logos_static_class_lookup$BluetoothManager() sharedInstance] setPowered:YES];
    [[_logos_static_class_lookup$BluetoothManager() sharedInstance] _powerChanged];
}

-(BOOL)currentState {
    return [[_logos_static_class_lookup$BluetoothManager() sharedInstance] powered];
}
@end
#line 35 "MFToggles/MFBluetoothToggle.xm"
