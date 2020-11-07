#import "MFSettingsCardViewController.h"
#import "MFMediaCardViewController.h"
#import "MFBaseViewController.h"

@interface MFControlCenterViewController : MFBaseViewController
@property(nonatomic, retain) UIScrollView *cardScrollView;
@property(nonatomic, retain) MFSettingsCardViewController *settingsCard;
@property(nonatomic, retain) MFMediaCardViewController *mediaCard;
@end
