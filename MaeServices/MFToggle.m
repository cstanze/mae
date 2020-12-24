#include "MFToggle.h"

@implementation MFToggle
+ (instancetype)sharedInstance {
    static MFToggle *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MFToggle alloc] init];
    });
    return sharedInstance;
}

-(void)toggleState {
    self.toggled = !self.toggled;
}

-(void)offState {
    self.toggled = NO;
}

-(void)onState {
    self.toggled = YES;
}

-(BOOL)currentState {
    return self.toggled;
}
@end