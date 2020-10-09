#import "MFControlCenterViewController.h"

@interface MFSystemViewController : UIViewController
@property(nonatomic, retain) UIView *backgroundView;
@property(nonatomic, retain) UIPageControl *pageControl;
@property(nonatomic, retain) MFControlCenterViewController *cardViewController;
+(id)sharedInstance;
-(void)setRevealProgress:(CGFloat)arg1;
@end
