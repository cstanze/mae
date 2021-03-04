#import "MFSystemViewController.h"
int ccheight;
@implementation MFSystemViewController
__strong static id _sharedObject;

-(id)init {
  self = [super init];

  _sharedObject = self;

  self.backgroundView = [[UIView alloc] init];
  self.backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
  [self.view addSubview:self.backgroundView];

  self.cardViewController = [[MFControlCenterViewController alloc] init];
  [self.view addSubview:self.cardViewController.view];

  return self;
}

+(id)sharedInstance {
	return _sharedObject;
}

-(void)viewDidLayoutSubviews {
  ccheight = self.view.frame.size.height * 0.742;

  // double height = self.view.frame.size.height;
  double height = [[UIScreen mainScreen] bounds].size.height;

  self.backgroundView.frame = [UIScreen mainScreen].bounds;
  self.cardViewController.view.frame = CGRectMake(0, height - ccheight + (height * 0.04), self.view.frame.size.width, ccheight);
}

-(void)setRevealProgress:(CGFloat)arg1 {
  self.backgroundView.alpha = arg1 / 2;

  double offset = ccheight * (1 - arg1);

  if(offset <= 0) {
    offset = 0;
  }

  self.cardViewController.view.frame = CGRectMake(0, (self.view.frame.size.height - ccheight) + offset + self.view.frame.size.height * 0.04, self.view.frame.size.width, ccheight);
}

-(CGFloat)revealProgress {
  return self.backgroundView.alpha * 2;
}
@end
