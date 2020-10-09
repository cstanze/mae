@interface MFToggle : NSObject
@property (nonatomic, assign) BOOL toggled;
-(void)toggleState;
-(void)offState;
-(void)onState;
-(BOOL)currentState;
@end