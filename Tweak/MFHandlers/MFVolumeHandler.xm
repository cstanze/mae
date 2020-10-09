#include "MFVolumeHandler.h"

@implementation MFVolumeHandler
-(void)actionWithFloatValue:(float)value {
    [[%c(AVSystemVolumeController) volumeController] setTargetVolume:value];
}

-(float)floatResultFromAction {
    return [[%c(AVSystemVolumeController) volumeController] volume];
}
@end