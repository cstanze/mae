#import "AlexaCell.h"

@implementation AlexaCell
static const int insetSize = 15;
static const int radiusSize = 13;

-(void)layoutSubviews {
  [super layoutSubviews];
  [self setSeparatorInset:UIEdgeInsetsMake(0, insetSize, 0, 0)];
  [self _setBackgroundInset:UIEdgeInsetsMake(0, insetSize, 0, insetSize)];
  [self setTranslatesAutoresizingMaskIntoConstraints:NO];
  self.layer.cornerRadius = radiusSize;
  self.layer.masksToBounds = YES;
}

-(void)setFrame:(CGRect)frame {
  frame.origin.x = insetSize;
  frame.size.width = [[UIScreen mainScreen] bounds].size.width - (insetSize * 2);
  [super setFrame:frame];
}
@end

@implementation AlexaSwitchCell
-(void)layoutSubviews {
  [super layoutSubviews];
  [self setSeparatorInset:UIEdgeInsetsMake(0, insetSize, 0, 0)];
  [self _setBackgroundInset:UIEdgeInsetsMake(0, insetSize, 0, insetSize)];
  [self setTranslatesAutoresizingMaskIntoConstraints:NO];
  self.layer.cornerRadius = radiusSize;
  self.layer.masksToBounds = YES;
}

-(void)setFrame:(CGRect)frame {
  frame.origin.x = insetSize;
  frame.size.width = [[UIScreen mainScreen] bounds].size.width - (insetSize * 2);
  [super setFrame:frame];
}
@end

@implementation AlexaSpinnerCell
-(void)layoutSubviews {
  [super layoutSubviews];
  [self setSeparatorInset:UIEdgeInsetsMake(0, insetSize, 0, 0)];
  [self _setBackgroundInset:UIEdgeInsetsMake(0, insetSize, 0, insetSize)];
  [self setTranslatesAutoresizingMaskIntoConstraints:NO];
  self.layer.cornerRadius = radiusSize;
  self.layer.masksToBounds = YES;
}

-(void)setFrame:(CGRect)frame {
  frame.origin.x = insetSize;
  frame.size.width = [[UIScreen mainScreen] bounds].size.width - (insetSize * 2);
  [super setFrame:frame];
}
@end
