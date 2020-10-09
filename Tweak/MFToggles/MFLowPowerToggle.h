#import "../MFCommon/MFToggle.h"

@interface MCBatterySaverMode
+(BOOL)isBatterySaverModeActive;
@end

@interface PSLowPowerModeSettingsDetail
+(void)setEnabled:(BOOL)arg1;
@end

@interface MFLowPowerToggle : MFToggle
@end