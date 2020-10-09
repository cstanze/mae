#import "MFSettingsCardViewController.h"
#import "MFMediaCardViewController.h"

@interface MFControlCenterViewController : UIViewController
@property(nonatomic, retain) UIScrollView *cardScrollView;
@property(nonatomic, retain) MFSettingsCardViewController *settingsCard;
@property(nonatomic, retain) MFMediaCardViewController *mediaCard;
@end
