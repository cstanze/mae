#import "MFSettingsCardViewController.h"

int offset = 0;

@implementation MFSettingsCardViewController
-(id)init {
  self = [super init];

  self.backdropView = [[MFCardBackdropView alloc] init];
  [self.view addSubview:self.backdropView];

  float buttonSpacing = [MFButton spacingForScreen:[UIScreen mainScreen]];
  float buttonSize = (self.view.frame.size.width - (buttonSpacing * 5)) / 4;

  [self setupAirplaneToggleWithSpacing:buttonSpacing size:buttonSize];

  [self setupWifiToggleWithSpacing:buttonSpacing size:buttonSize];

  [self setupBluetoothToggleWithSpacing:buttonSpacing size:buttonSize];

  // Notifications
  [[NSNotificationCenter defaultCenter] addObserver:self
      selector:@selector(bluetoothPowerDidChange) 
      name:@"MFBluetoothPowerChange"
      object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self
      selector:@selector(wifiPowerDidChange) 
      name:@"MFWifiPowerChange"
      object:nil];

  return self;
}

-(void)setupAirplaneToggleWithSpacing:(float)buttonSpacing size:(float)buttonSize {
  // Airplane Setup
  BOOL airState = [airToggle currentState];
  self.airplaneButton = [MFButton buttonWithType:UIButtonTypeCustom];
  self.airplaneButton.translatesAutoresizingMaskIntoConstraints = NO;
  self.airplaneButton.layer.cornerRadius = buttonSize / 2;
  self.airplaneButton.backgroundColor = airState ? [UIColor systemOrangeColor] : [UIColor colorWithWhite:(2/3) alpha:0.7];
  [self.airplaneButton setImage:[UIImage systemImageNamed:@"airplane"] forState:UIControlStateNormal];
  self.airplaneButton.tintColor = [UIColor whiteColor]; // airState ? [UIColor blackColor] : [UIColor whiteColor];
  [self.airplaneButton addTarget:self action:@selector(toggleAirplaneMode:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.airplaneButton];

  // Airplane Constriants
  [self.airplaneButton.widthAnchor constraintEqualToConstant:buttonSize].active = YES;
  [self.airplaneButton.heightAnchor constraintEqualToConstant:buttonSize].active = YES;
  [self.airplaneButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:buttonSpacing].active = YES;
  [self.airplaneButton.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:10].active = YES;
}

-(void)setupWifiToggleWithSpacing:(float)buttonSpacing size:(float)buttonSize {
  // Wifi Setup
  BOOL wfState = [wifiToggle currentState];
  self.wifiButton = [MFButton buttonWithType:UIButtonTypeCustom];
  self.wifiButton.translatesAutoresizingMaskIntoConstraints = NO;
  self.wifiButton.layer.cornerRadius = buttonSize / 2;
  self.wifiButton.backgroundColor = wfState ? [UIColor systemBlueColor] : [UIColor colorWithWhite:(2/3) alpha:0.7];
  [self.wifiButton setImage:(wfState ? [UIImage systemImageNamed:@"wifi"] : [UIImage systemImageNamed:@"wifi.slash"]) forState:UIControlStateNormal];
  self.wifiButton.tintColor = [UIColor whiteColor];// wfState ? [UIColor blackColor] : [UIColor whiteColor];
  [self.wifiButton addTarget:self action:@selector(toggleWifiPower:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.wifiButton];

  // Wifi Constraints
  [self.wifiButton.widthAnchor constraintEqualToConstant:buttonSize].active = YES;
  [self.wifiButton.heightAnchor constraintEqualToConstant:buttonSize].active =  YES;
  [self.wifiButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:((buttonSpacing * 2) + (buttonSize * 1))].active = YES;
  [self.wifiButton.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:10].active = YES;
}

-(void)setupBluetoothToggleWithSpacing:(float)buttonSpacing size:(float)buttonSize {
  // Bluetooth Setup
  BOOL blueState = [bluetoothToggle currentState];
  self.bluetoothButton = [MFButton buttonWithType:UIButtonTypeCustom];
  self.bluetoothButton.translatesAutoresizingMaskIntoConstraints = NO;
  self.bluetoothButton.layer.cornerRadius = buttonSize / 2;
  self.bluetoothButton.backgroundColor = blueState ? [UIColor systemBlueColor] : [UIColor colorWithWhite:(2/3) alpha:0.7];
  self.bluetoothButton.tintColor = [UIColor whiteColor]; // airState ? [UIColor blackColor] : [UIColor whiteColor];
  [self.bluetoothButton addTarget:self action:@selector(toggleBluetoothPower:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.bluetoothButton];

  // Bluetooth Constraints
  [self.bluetoothButton.widthAnchor constraintEqualToConstant:buttonSize].active = YES;
  [self.bluetoothButton.heightAnchor constraintEqualToConstant:buttonSize].active =  YES;
  [self.bluetoothButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:((buttonSpacing * 3) + (buttonSize * 2))].active = YES;
  [self.bluetoothButton.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:10].active = YES;
}

-(void)toggleAirplaneMode:(MFButton*)sender {
  [airToggle toggleState];
  if (![airToggle currentState]) {
    [UIView animateWithDuration:0.2 animations:^{
      self.airplaneButton.backgroundColor = [UIColor systemOrangeColor];
    }];
    // self.airplaneButton.tintColor = [UIColor whiteColor];
  } else {
    [UIView animateWithDuration:0.2 animations:^{
      self.airplaneButton.backgroundColor = [UIColor colorWithWhite:(2/3) alpha:0.7];
    }];
    // self.airplaneButton.tintColor = [UIColor blackColor];
  }
}

-(void)toggleWifiPower:(MFButton*)sender {
  [wifiToggle toggleState];
}

-(void)toggleBluetoothPower:(MFButton*)sender {
  [bluetoothToggle toggleState];
}

-(void)wifiPowerDidChange {
  dispatch_async(dispatch_get_main_queue(), ^{
    [UIView animateWithDuration:0.2 animations:^{
      self.wifiButton.backgroundColor = ([wifiToggle currentState]) ? [UIColor systemBlueColor] : [UIColor colorWithWhite:(2/3) alpha:0.7];
    }];
    [self.wifiButton setImage:[UIImage systemImageNamed:([wifiToggle currentState]) ? @"wifi" : @"wifi.slash"] forState:UIControlStateNormal];
  });
}

-(void)bluetoothPowerDidChange {
  [UIView animateWithDuration:0.2 animations:^{
    self.bluetoothButton.backgroundColor = ([bluetoothToggle currentState]) ? [UIColor systemBlueColor] : [UIColor colorWithWhite:(2/3) alpha:0.7];
  }];
  // [self.bluetoothButton setImage:[UIImage systemImageNamed:([bluetoothToggle currentState]) ? @"bluetooth" : @"bluetooth_disabled"] forState:UIControlStateNormal];
}

-(void)viewDidLayoutSubviews {
  self.backdropView.frame = CGRectMake(offset, 0, self.view.frame.size.width - offset*2, self.view.frame.size.height);
}
@end
