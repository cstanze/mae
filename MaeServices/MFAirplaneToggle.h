#import "MFToggle.h"

@interface SBAirplaneModeController
+(SBAirplaneModeController*)sharedInstance;
-(void)airplaneModeChanged;
-(BOOL)isInAirplaneMode;
-(void)setInAirplaneMode:(BOOL)arg1;
@end

@interface MFAirplaneToggle : MFToggle
@end