#import "MFSystemViewController.h"
int ccheight;
@implementation MFSystemViewController
__strong static id _sharedObject;

-(id)init {
  self = [super init];

  _sharedObject = self;

  self.backgroundView = [[UIView alloc] init];
  self.backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
  [self.view addSubview:self.backgroundView];

  self.cardViewController = [[MFControlCenterViewController alloc] init];
  [self.view addSubview:self.cardViewController.view];

  return self;
}

+(id)sharedInstance {
	return _sharedObject;
}

-(void)viewDidLayoutSubviews {
  ccheight = self.view.frame.size.height * 0.842; //* 0.742;
  NSLog(@"[Mae] layout ccheight = %i", ccheight);

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

  self.cardViewController.view.frame = CGRectMake(
    0,
    (self.view.frame.size.height - ccheight) + offset + self.view.frame.size.height * 0.04,
    self.view.frame.size.width, 
    ccheight
  );
  [self.cardViewController.mainVC.backdropView setWeighting:arg1];
  
  if(arg1 == 1) {
    [self.cardViewController.mainVC openDidOccur];
  }
}

-(CGFloat)revealProgress {
  return self.backgroundView.alpha * 2;
}

-(void)updateRevealProgressByTravelDelta {
  [self setRevealProgress:MIN(_travelDistance / ccheight, 1)];
}

-(void)setTravelDistance:(CGFloat)distance withVelocity:(CGFloat)velocity {
  [self setTravelDistance:distance withVelocity:velocity andStop:NO];
}

-(void)setTravelDistance:(CGFloat)distance withVelocity:(CGFloat)velocity andStop:(BOOL)stop {
  NSLog(@"[Mae] set travel distance: %f", distance);
  _travelDistance = distance;
  
  if(stop && (distance / ccheight) < 0.13) {
    [UIView animateWithDuration:0.3 animations:^{
      [self setRevealProgress:0];
    }];
  } else if(stop && (distance / ccheight) >= 0.13) {
    [UIView animateWithDuration:0.3
            delay:0
            usingSpringWithDamping:0.742
            initialSpringVelocity:velocity
            options:0
            animations:^{
      [self setRevealProgress:1];
    } completion:nil];
  } else {
    [self updateRevealProgressByTravelDelta];
  }
}

-(CGFloat)travelDistance {
  return _travelDistance;
}

@end
