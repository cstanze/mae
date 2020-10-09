#import "../MFToggles/MFWifiToggle.h"

%hook WFClient
-(void)setPowered:(BOOL)arg1 {
    [[NSNotificationCenter defaultCenter] 
        postNotificationName:@"MFWifiPowerChange" 
        object:self];
    %orig;
}
%end