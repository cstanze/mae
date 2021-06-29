#import "MFToggle.h"

@interface WFClient
+(WFClient*)sharedInstance;
-(BOOL)powered;
-(void)setPowered:(BOOL)arg1;
-(void)_updatePowerState;
@end

@interface MFWifiToggle : MFToggle
@end