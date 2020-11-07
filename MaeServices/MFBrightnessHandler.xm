#include "MFBrightnessHandler.h"

@implementation MFBrightnessHandler
-(void)actionWithFloatValue:(float)value {
    [[%c(SBBrightnessController) sharedBrightnessController] _setBrightnessLevel:value showHUD:NO];
}

-(float)floatResultFromAction {
    return [[UIScreen mainScreen] brightness];
}
@end
