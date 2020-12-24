#import "MFSettingsCardViewController.h"
#import <QuartzCore/CAPackage+Private.h>

@implementation MFSettingsCardViewController
-(id)init {
  self = [super init];

  self.backdropView = [[MFCardBackdropView alloc] init];
  [self.backdropView setDark:YES];  
  [self.view addSubview:self.backdropView];

  UIButton *darkModeButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [darkModeButton setTitle:@"Dark Toggle" forState:UIControlStateNormal];
  [darkModeButton addTarget:self action:@selector(toggleDark) forControlEvents:UIControlEventTouchUpInside];
  darkModeButton.frame = CGRectMake(10, 10, 100, 100);
  [self.view addSubview:darkModeButton];

  return self;
}

-(void)viewDidLayoutSubviews {
  self.backdropView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

-(void)toggleDark {
  [[NSClassFromString(@"UIUserInterfaceStyleArbiter") sharedInstance] toggleCurrentStyle];
}
@end
