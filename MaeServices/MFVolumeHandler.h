#import "MFHandler.h"

@interface AVSystemVolumeController
+(id)volumeController;
-(float)volume;
-(void)setTargetVolume:(float)arg1;
@end

@interface MFVolumeHandler : MFHandler
@end