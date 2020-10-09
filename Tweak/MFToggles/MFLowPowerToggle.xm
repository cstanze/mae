#import "MFLowPowerToggle.h"

@implementation MFLowPowerToggle
-(void)toggleState {
    self.toggled = !self.toggled;
    [%c(PSLowPowerModeSettingsDetail) setEnabled:self.toggled];
}

-(void)offState {
    self.toggled = NO;
    [%c(PSLowPowerModeSettingsDetail) setEnabled:self.toggled];
}

-(void)onState {
    self.toggled = YES;
    [%c(PSLowPowerModeSettingsDetail) setEnabled:self.toggled];
}

-(BOOL)currentState {
    return [[NSProcessInfo processInfo] isLowPowerModeEnabled];
}

@end