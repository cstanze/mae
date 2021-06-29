#import "MFControlCenterViewController.h"

@implementation MFControlCenterViewController
-(id)init {
  self = [super init];

  self.mainVC = [[MFCentralViewController alloc] init];
  [self.view addSubview:self.mainVC.view];

  return self;
}
-(void)viewDidLayoutSubviews {
  self.mainVC.view.frame = CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height);
}
@end
