#import "MFCardBackdropView.h"

@implementation MFCardBackdropView
-(id)init {
  self = [super init];

  UIVisualEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterial];
  self.backdropView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
  [self addSubview:self.backdropView];

  self.layer.cornerRadius = 13;
  self.clipsToBounds = YES;
  
  return self;
}
-(void)layoutSubviews {
  self.backdropView.frame = self.bounds;
}
@end
