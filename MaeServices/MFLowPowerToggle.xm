#import "MFLowPowerToggle.h"

@implementation MFLowPowerToggle
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