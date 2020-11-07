#include "MFWifiToggle.h"

@implementation MFWifiToggle
-(void)toggleState {
    self.toggled = ![[%c(WFClient) sharedInstance] powered];
    [[%c(WFClient) sharedInstance] setPowered:self.toggled];
    [[%c(WFClient) sharedInstance] _updatePowerState];
}

-(void)offState {
    self.toggled = NO;
    [[%c(WFClient) sharedInstance] setPowered:NO];
    [[%c(WFClient) sharedInstance] _updatePowerState];
}

-(void)onState {
    self.toggled = YES;
    [[%c(WFClient) sharedInstance] setPowered:YES];
    [[%c(WFClient) sharedInstance] _updatePowerState];
}

-(BOOL)currentState {
    return [[%c(WFClient) sharedInstance] powered];
}
@end