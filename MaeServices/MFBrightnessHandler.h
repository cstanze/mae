#import "MFHandler.h"

@interface SBBrightnessController
+(id)sharedBrightnessController;
-(void)_setBrightnessLevel:(float)arg1 showHUD:(BOOL)arg2;
@end

@interface MFBrightnessHandler : MFHandler
@end