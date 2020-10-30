/* Common */
    #import "MFCardBackdropView.h"
    #import "MFButton.h"
    #import "../MFCommon/MaeCommon.hh"
    #import "MFBaseViewController.h"

@interface MFSettingsCardViewController : MFBaseViewController
@property(nonatomic, retain) MFCardBackdropView *backdropView;
@property(nonatomic, retain) MFButton *airplaneButton;
@property(nonatomic, retain) MFButton *cellularButton;
@property(nonatomic, retain) MFButton *wifiButton;
@property(nonatomic, retain) MFButton *bluetoothButton;

// Toggles
-(void)setupAirplaneToggleWithSpacing:(float)buttonSpacing size:(float)buttonSize ;
-(void)setupWifiToggleWithSpacing:(float)buttonSpacing size:(float)buttonSize ;
-(void)setupBluetoothToggleWithSpacing:(float)buttonSpacing size:(float)buttonSize ;
-(void)toggleAirplaneMode:(MFButton*)sender ;
-(void)toggleWifiPower:(MFButton*)sender ;
// -(void)toggleBluetoothPower:(MFButton*)sender ;
// Notifications
-(void)wifiPowerDidChange;
// -(void)bluetoothPowerDidChange;
@end
