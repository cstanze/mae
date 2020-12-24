#import "MFControlCenterViewController.h"
#import "MFBaseViewController.h"

@interface MFSystemViewController : MFBaseViewController
@property (nonatomic, retain) UIView *backgroundView;
@property (nonatomic, retain) UIPageControl *pageControl;
@property (nonatomic, retain) MFControlCenterViewController *cardViewController;
+(id)sharedInstance;
-(void)setRevealProgress:(CGFloat)arg1;
@end
