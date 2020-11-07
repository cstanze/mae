#include "MFToggle.h"

@implementation MFToggle
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