#include "MFAirplaneToggle.h"

@implementation MFAirplaneToggle
-(void)toggleState {
    self.toggled = ![[%c(SBAirplaneModeController) sharedInstance] isInAirplaneMode];
    [[%c(SBAirplaneModeController) sharedInstance] setInAirplaneMode:self.toggled];
    [[%c(SBAirplaneModeController) sharedInstance] airplaneModeChanged];
}

-(void)offState {
    [[%c(SBAirplaneModeController) sharedInstance] setInAirplaneMode:NO];
    [[%c(SBAirplaneModeController) sharedInstance] airplaneModeChanged];
    self.toggled = NO;
}

-(void)onState {
    [[%c(SBAirplaneModeController) sharedInstance] setInAirplaneMode:YES];
    [[%c(SBAirplaneModeController) sharedInstance] airplaneModeChanged];
    self.toggled = YES;
}

-(BOOL)currentState {
    return [[%c(SBAirplaneModeController) sharedInstance] isInAirplaneMode];
}
@end