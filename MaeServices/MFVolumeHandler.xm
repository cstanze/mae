#import "MFVolumeHandler.h"

@implementation MFVolumeHandler
+ (instancetype)sharedInstance {
    static MFVolumeHandler *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MFVolumeHandler alloc] init];
    });
    return sharedInstance;
}

-(void)actionWithFloatValue:(float)value {
    [[%c(AVSystemVolumeController) volumeController] setTargetVolume:value];
}

-(float)floatResultFromAction {
    return [[%c(AVSystemVolumeController) volumeController] volume];
}
@end