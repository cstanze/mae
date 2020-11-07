#import "MFMediaCardViewController.h"
int offsetm = 0;
@implementation MFMediaCardViewController
-(id)init {
  self = [super init];

  self.backdropView = [[MFCardBackdropView alloc] init];
  [self.view addSubview:self.backdropView];

  return self;
}
-(void)viewDidLayoutSubviews {
  self.backdropView.frame = CGRectMake(offsetm, 0, self.view.frame.size.width - offsetm*2, self.view.frame.size.height);
}
@end
