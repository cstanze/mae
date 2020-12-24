#import "MFControlCenterViewController.h"

@implementation MFControlCenterViewController
-(id)init {
  self = [super init];

  self.cardScrollView = [[UIScrollView alloc] init];
  self.cardScrollView.scrollEnabled = YES;
  self.cardScrollView.pagingEnabled = YES;
  self.cardScrollView.showsVerticalScrollIndicator = NO;
  self.cardScrollView.showsHorizontalScrollIndicator = NO;
  [self.view addSubview:self.cardScrollView];

  self.settingsCard = [[MFSettingsCardViewController alloc] init];
  [self.cardScrollView addSubview:self.settingsCard.view];

  return self;
}
-(void)viewDidLayoutSubviews {
  self.cardScrollView.frame = self.view.bounds;
  self.cardScrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);

  self.settingsCard.view.frame = CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height);
}
@end
