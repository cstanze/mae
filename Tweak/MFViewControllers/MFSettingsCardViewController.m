#import "MFSettingsCardViewController.h"

int offset = 0;

@implementation MFSettingsCardViewController
-(id)init {
  self = [super init];

  self.backdropView = [[MFCardBackdropView alloc] init];
  [self.view addSubview:self.backdropView];

  float buttonSpacing = [MFButton spacingForScreen:[UIScreen mainScreen]];
  float buttonSize = (self.view.frame.size.width - (buttonSpacing * 5)) / 4;

  // Airplane Setup
  BOOL airState = [airToggle currentState];
  self.airplaneButton = [MFButton buttonWithType:UIButtonTypeCustom];
  self.airplaneButton.translatesAutoresizingMaskIntoConstraints = NO;
  self.airplaneButton.layer.cornerRadius = buttonSize / 2;
  self.airplaneButton.backgroundColor = airState ? [UIColor systemOrangeColor] : [UIColor colorWithWhite:(2/3) alpha:0.7];
  [self.airplaneButton setImage:[UIImage systemImageNamed:@"airplane"] forState:UIControlStateNormal];
  self.airplaneButton.tintColor = airState ? [UIColor blackColor] : [UIColor whiteColor];
  [self.airplaneButton addTarget:self action:@selector(toggleAirplaneMode:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.airplaneButton];

  // Airplane Constriants
  [self.airplaneButton.widthAnchor constraintEqualToConstant:buttonSize].active = YES;
  [self.airplaneButton.heightAnchor constraintEqualToConstant:buttonSize].active = YES;
  [self.airplaneButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:buttonSpacing].active = YES;
  [self.airplaneButton.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:10].active = YES;

  // Wifi Setup
  BOOL wfState = [wifiToggle currentState];
  self.wifiButton = [MFButton buttonWithType:UIButtonTypeCustom];
  self.wifiButton.translatesAutoresizingMaskIntoConstraints = NO;
  self.wifiButton.layer.cornerRadius = buttonSize / 2;
  self.wifiButton.backgroundColor = wfState ? [UIColor systemBlueColor] : [UIColor colorWithWhite:(2/3) alpha:0.7];
  [self.wifiButton setImage:(wfState ? [UIImage systemImageNamed:@"wifi"] : [UIImage systemImageNamed:@"wifi.slash"]) forState:UIControlStateNormal];
  self.wifiButton.tintColor = wfState ? [UIColor blackColor] : [UIColor whiteColor];
  [self.wifiButton addTarget:self action:@selector(toggleWifiPower:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.wifiButton];

  // Wifi Constraints
  [self.wifiButton.widthAnchor constraintEqualToConstant:buttonSize].active = YES;
  [self.wifiButton.heightAnchor constraintEqualToConstant:buttonSize].active =  YES;
  [self.wifiButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:((buttonSpacing * 2) + (buttonSize * 1))].active = YES;
  [self.wifiButton.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:10].active = YES;


  // Notifications
  // [[NSNotificationCenter defaultCenter] addObserver:self
  //     selector:@selector(bluetoothPowerDidChange) 
  //     name:@"MFBluetoothPowerChange"
  //     object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self
      selector:@selector(wifiPowerDidChange) 
      name:@"MFWifiPowerChange"
      object:nil];

  return self;
}

-(void)toggleAirplaneMode:(MFButton*)sender {
  [airToggle toggleState];
  if([airToggle currentState]) {
    self.airplaneButton.backgroundColor = [UIColor systemOrangeColor];
    self.airplaneButton.tintColor = [UIColor whiteColor];
  } else {
    self.airplaneButton.backgroundColor = [UIColor colorWithWhite:(2/3) alpha:0.7];
    self.airplaneButton.tintColor = [UIColor blackColor];
  }
}

-(void)toggleWifiPower:(MFButton*)sender {
  [wifiToggle toggleState];
  if([wifiToggle currentState]) {
    self.wifiButton.backgroundColor = [UIColor systemBlueColor];
    self.wifiButton.tintColor = [UIColor whiteColor];
    [self.wifiButton setImage:[UIImage systemImageNamed:@"wifi"] forState:UIControlStateNormal];
  } else {
    self.wifiButton.backgroundColor = [UIColor colorWithWhite:(2/3) alpha:0.7];
    self.wifiButton.tintColor = [UIColor blackColor];
    [self.wifiButton setImage:[UIImage systemImageNamed:@"wifi.slash"] forState:UIControlStateNormal];
  }
}

-(void)wifiPowerDidChange {
  if([wifiToggle currentState]) {
    self.wifiButton.backgroundColor = [UIColor systemBlueColor];
    self.wifiButton.tintColor = [UIColor whiteColor];
    [self.wifiButton setImage:[UIImage systemImageNamed:@"wifi"] forState:UIControlStateNormal];
  } else {
    self.wifiButton.backgroundColor = [UIColor clearColor];
    self.wifiButton.tintColor = [UIColor blackColor];
    [self.wifiButton setImage:[UIImage systemImageNamed:@"wifi.slash"] forState:UIControlStateNormal];
  }
}

-(void)viewDidLayoutSubviews {
  self.backdropView.frame = CGRectMake(offset, 0, self.view.frame.size.width - offset*2, self.view.frame.size.height);
}
@end
