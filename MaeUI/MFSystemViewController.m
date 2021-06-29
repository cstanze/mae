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

  NSLog(
    @"[Mae] revealing controller (super = %@) (self = %@)",
    self.view, 
    self.cardViewController.view
  );
  NSLog(
    @"[Mae] hidden_super = %@, hidden_self = %@", 
    self.view.hidden ? @"YES" : @"NO",
    self.cardViewController.view.hidden ? @"YES" : @"NO"
  );
  self.cardViewController.view.frame = CGRectMake(0, (self.view.frame.size.height - ccheight) + offset + self.view.frame.size.height * 0.04, self.view.frame.size.width, ccheight);
}

-(CGFloat)revealProgress {
  return self.backgroundView.alpha * 2;
}

-(void)updateRevealProgressByTravelDelta {
  NSLog(@"[Mae] set reveal progress by travel delta: %f", MIN(_travelDistance / ccheight, 1));
  [self setRevealProgress:MIN(_travelDistance / ccheight, 1)];
}

-(void)setTravelDistance:(CGFloat)distance {
  [self setTravelDistance:distance withStop:NO];
}

-(void)setTravelDistance:(CGFloat)distance withStop:(BOOL)stop {
  NSLog(@"[Mae] set travel distance: %f", distance);
  _travelDistance = distance;
  
  if(stop && (distance / ccheight) < 0.6) {
    [UIView animateWithDuration:0.5 animations:^{
      [self setRevealProgress:0];
    }];
  } else {
    [self updateRevealProgressByTravelDelta];
  }
}

@end
