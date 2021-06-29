#import "MFControlCenterViewController.h"
#import "MFBaseViewController.h"
#import "MFCardBackdropView.h"

@interface MFSystemViewController : MFBaseViewController {
  CGFloat _travelDistance;
}
@property (nonatomic, retain) UIView *backgroundView;
@property (nonatomic, retain) MFControlCenterViewController *cardViewController;
+(id)sharedInstance;
-(void)setRevealProgress:(CGFloat)arg1;
-(CGFloat)revealProgress;
-(void)updateRevealProgressByTravelDelta;
-(void)setTravelDistance:(CGFloat)distance;
-(void)setTravelDistance:(CGFloat)distance withStop:(BOOL)stop;
// -(CGFloat)travelDistance;
@end
