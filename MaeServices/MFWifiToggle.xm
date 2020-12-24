#import "MFWifiToggle.h"

@implementation MFWifiToggle
+ (instancetype)sharedInstance {
    static MFWifiToggle *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MFWifiToggle alloc] init];
    });
    return sharedInstance;
}

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