#import "MFBaseViewController.h"

@implementation MFBaseViewController
-(BOOL)_canShowWhileLocked {
	return YES;
}
@end

@implementation MFBaseScrollViewController
-(void)loadView {
	[super loadView];
	self.view = [[UIScrollView alloc] initWithFrame:self.view.frame];
}

-(BOOL)_canShowWhileLocked {
	return YES;
}
@end