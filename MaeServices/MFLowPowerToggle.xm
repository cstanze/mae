#import "MFLowPowerToggle.h"

@implementation MFLowPowerToggle
+ (instancetype)sharedInstance {
    static MFLowPowerToggle *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MFLowPowerToggle alloc] init];
    });
    return sharedInstance;
}

-(void)toggleState {
    self.toggled = !self.toggled;
    [%c(PSLowPowerModeSettingsDetail) setPowerMode:(self.toggled ? 1 : 0) error:nil];
}

-(void)offState {
    self.toggled = NO;
    [%c(PSLowPowerModeSettingsDetail) setPowerMode:0 error:nil];
}

-(void)onState {
    self.toggled = YES;
    [%c(PSLowPowerModeSettingsDetail) setPowerMode:1 error:nil];
}

-(BOOL)currentState {
    return [[NSProcessInfo processInfo] isLowPowerModeEnabled];
}

@end