#import "AlexaCell.h"

@implementation AlexaCell
-(void)layoutSubviews {
  [super layoutSubviews];
  [self setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 0)];
  [self _setBackgroundInset:UIEdgeInsetsMake(0, 15, 0, 15)];
  [self setTranslatesAutoresizingMaskIntoConstraints:NO];
  self.layer.cornerRadius = 13;
  self.layer.masksToBounds = YES;
}

-(void)setFrame:(CGRect)frame {
  frame.origin.x = 15;
  frame.size.width = [[UIScreen mainScreen] bounds].size.width - 30;
  [super setFrame:frame];
}
@end

@implementation AlexaSwitchCell
-(void)layoutSubviews {
  [super layoutSubviews];
  [self setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 0)];
  [self _setBackgroundInset:UIEdgeInsetsMake(0, 15, 0, 15)];
  [self setTranslatesAutoresizingMaskIntoConstraints:NO];
  self.layer.cornerRadius = 13;
  self.layer.masksToBounds = YES;
}

-(void)setFrame:(CGRect)frame {
  frame.origin.x = 15;
  frame.size.width = [[UIScreen mainScreen] bounds].size.width - 30;
  [super setFrame:frame];
}
@end
