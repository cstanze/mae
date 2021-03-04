#import "MFCardBackdropView.h"
#import <QuartzCore/CALayer+Private.h>

@implementation MFCardBackdropView
-(id)init {
  self = [super init];

  // UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:];
  // self.backdropView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
  MTMaterialView *mtview = [NSClassFromString(@"MTMaterialView") materialViewWithRecipeNamed:@"plattersDark" inBundle:nil configuration:1 initialWeighting:1.0 scaleAdjustment:nil];
  [mtview setBlurEnabled:YES];
  self.backdropView = mtview;
  [self addSubview:self.backdropView];

  self.backdropView.layer.cornerCurve = kCACornerCurveContinuous;

  self.backdropView.layer.cornerRadius = 52;
  self.backdropView.layer.maskedCorners = (kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner);
  self.backdropView.clipsToBounds = YES;
  
  return self;
}

-(void)setDark:(BOOL)dark {
  [self.backdropView setRecipeName:(dark ? @"plattersDark" : @"platters")];
}

-(void)layoutSubviews {
  self.backdropView.frame = self.bounds;
}

-(void)setWeighting:(CGFloat)weight {
  [self.backdropView setWeighting:weight];
}
@end
