/* Common */
    #import "MFCardBackdropView.h"
    #import "MFRoundButton.h"
    #import <MaeCommon/MaeCommon.hh>
    #import "MFBaseViewController.h"

@interface MFSettingsCardViewController : MFBaseViewController
@property(nonatomic, retain) MFCardBackdropView *backdropView;
@property(nonatomic, retain) MFRoundButton *airplaneButton;
@property(nonatomic, retain) MFRoundButton *cellularButton;
@property(nonatomic, retain) MFRoundButton *wifiButton;
@property(nonatomic, retain) MFRoundButton *bluetoothButton;

// Toggles
-(void)setupAirplaneToggleWithSpacing:(float)buttonSpacing size:(float)buttonSize ;
-(void)setupWifiToggleWithSpacing:(float)buttonSpacing size:(float)buttonSize ;
-(void)setupBluetoothToggleWithSpacing:(float)buttonSpacing size:(float)buttonSize ;
-(void)toggleAirplaneMode:(MFRoundButton*)sender ;
-(void)toggleWifiPower:(MFRoundButton*)sender ;
// -(void)toggleBluetoothPower:(MFRoundButton*)sender ;
// Notifications
-(void)wifiPowerDidChange;
// -(void)bluetoothPowerDidChange;
@end
