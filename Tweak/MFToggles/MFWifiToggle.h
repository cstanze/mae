#import "../MFCommon/MFToggle.h"

@interface WFClient
+(WFClient*)sharedInstance;
-(BOOL)powered;
-(void)setPowered:(BOOL)arg1;
@end

@interface MFWifiToggle : MFToggle
@end