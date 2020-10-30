#import "MFBluetoothToggle.h"

@implementation MFBluetoothToggle
-(void)toggleState {
    self.toggled = ![[%c(BluetoothManager) sharedInstance] powered];
    [[%c(BluetoothManager) sharedInstance] setPowered:self.toggled];
    [[%c(BluetoothManager) sharedInstance] _powerChanged];
}

-(void)offState {
    self.toggled = NO;
    [[%c(BluetoothManager) sharedInstance] setPowered:NO];
    [[%c(BluetoothManager) sharedInstance] _powerChanged];
}

-(void)onState {
    self.toggled = YES;
    [[%c(BluetoothManager) sharedInstance] setPowered:YES];
    [[%c(BluetoothManager) sharedInstance] _powerChanged];
}

-(BOOL)currentState {
    return [[%c(BluetoothManager) sharedInstance] powered];
}
@end