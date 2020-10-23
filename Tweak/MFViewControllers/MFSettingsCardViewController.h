/* Common */
    #import "MFCardBackdropView.h"
    #import "MFButton.h"
    #import "../MFCommon/MaeCommon.hh"

@interface MFSettingsCardViewController : UIViewController
@property(nonatomic, retain) MFCardBackdropView *backdropView;
@property(nonatomic, retain) MFButton *airplaneButton;
@property(nonatomic, retain) MFButton *wifiButton;

// Toggles
-(void)toggleAirplaneMode:(MFButton*)sender;
-(void)toggleWifiPower:(MFButton*)sender;
// -(void)toggleBluetoothPower:(MFButton*)sender;
// Notifications
-(void)wifiPowerDidChange;
// -(void)bluetoothPowerDidChange;
@end
