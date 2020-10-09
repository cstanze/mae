#include "MFWifiToggle.h"

@implementation MFWifiToggle
-(void)toggleState {
    self.toggled = ![[%c(WFClient) sharedInstance] powered];
    [[%c(WFClient) sharedInstance] setPowered:self.toggled];
}

-(void)offState {
    self.toggled = NO;
    [[%c(WFClient) sharedInstance] setPowered:NO];
}

-(void)onState {
    self.toggled = YES;
    [[%c(WFClient) sharedInstance] setPowered:YES];
}

-(BOOL)currentState {
    return [[%c(WFClient) sharedInstance] powered];
}
@end