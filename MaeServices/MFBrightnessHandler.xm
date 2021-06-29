#import "MFBrightnessHandler.h"

@implementation MFBrightnessHandler
+ (instancetype)sharedInstance {
    static MFBrightnessHandler *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MFBrightnessHandler alloc] init];
    });
    return sharedInstance;
}

-(void)actionWithFloatValue:(float)value {
    [[%c(SBBrightnessController) sharedBrightnessController] _setBrightnessLevel:value showHUD:NO];
}

-(float)floatResultFromAction {
    return [[UIScreen mainScreen] brightness];
}
@end
