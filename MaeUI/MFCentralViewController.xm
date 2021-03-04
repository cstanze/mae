#import "MFCentralViewController.h"
#import <QuartzCore/CAPackage+Private.h>

@implementation MFCentralViewController
-(id)init {
  self = [super init];

  self.backdropView = [[MFCardBackdropView alloc] init]; 
  [self.view addSubview:self.backdropView];

  return self;
}

-(void)viewDidLayoutSubviews {
  self.backdropView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

@end
