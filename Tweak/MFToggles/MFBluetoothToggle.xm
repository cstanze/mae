#import "MFBluetoothToggle.h"

/*
@interface BluetoothManager
+(id)sharedInstance;
-(BOOL)powered;
-(BOOL)setPowered:(BOOL)arg1;
-(void)_powerChanged;
@end
*/

@implementation MFBluetoothToggle
-(void)toggleState {
    self.toggled = !self.toggled;
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