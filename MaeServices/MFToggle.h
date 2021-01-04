#import <UIKit/UIKit.h>

@interface MFToggle : NSObject
@property (nonatomic, assign) BOOL toggled;
+(instancetype)sharedInstance;
-(void)toggleState;
-(void)offState;
-(void)onState;
-(BOOL)currentState;
@end