#import "../MFToggles/MFWifiToggle.h"

%hook WFClient
-(void)_updatePowerState {
    %orig;
    [[NSNotificationCenter defaultCenter] 
        postNotificationName:@"MFWifiPowerChange" 
        object:self];
}
%end