#import "../MFCommon/MFToggle.h"

@interface _CDBatterySaver
+ (id)sharedInstance;
- (BOOL)setPowerMode:(long long)arg1 error:(id *)arg2;
@end

@interface MFLowPowerToggle : MFToggle
@end