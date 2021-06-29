#import "MFToggle.h"

@interface BluetoothManager
+(id)sharedInstance;
-(BOOL)powered;
-(BOOL)setPowered:(BOOL)arg1;
-(void)_powerChanged;
@end

@interface MFBluetoothToggle : MFToggle
@end