#import "../MFToggles/MFLowPowerToggle.h"

%hook BCBatteryDevice
-(void)setLowPower:(BOOL)arg1 {
    [[NSNotificationCenter defaultCenter] 
        postNotificationName:@"MFLowPowerModeChange" 
        object:self];
    %orig;
}
%end