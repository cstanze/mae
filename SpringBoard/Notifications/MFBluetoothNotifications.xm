#import <MaeServices/MFBluetoothToggle.h>

%hook BluetoothManager
-(void)_powerChanged {
    [[NSNotificationCenter defaultCenter] 
        postNotificationName:@"MFBluetoothPowerChange" 
        object:self];
    %orig;
}
%end