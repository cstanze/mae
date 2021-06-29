#import <UIKit/UIKit.h>

@interface MFHandler : NSObject
+(instancetype)sharedInstance;
-(void)actionWithFloatValue:(float)value;
-(float)floatResultFromAction;
@end