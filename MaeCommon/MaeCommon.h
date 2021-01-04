/* Toggles & Handlers */
#import <MaeServices/MFAirplaneToggle.h>
#import <MaeServices/MFWifiToggle.h>
#import <MaeServices/MFBluetoothToggle.h>
#import <MaeServices/MFLowPowerToggle.h>
#import <MaeServices/MFVolumeHandler.h>
#import <MaeServices/MFBrightnessHandler.h>  

/* Private hesders */
#import <ControlCenterServices/Private.h>
#import <ControlCenterUI/Modules.h>
  
/* Imports */
#import <Cephei/HBPreferences.h>

/* Preferences */
// TODO: Remove this and replace it with something... better
static BOOL maeEnabled;
static BOOL plattersDark;

/* Prefs Obj */
HBPreferences *prefs;

@interface NSObject (Mae)
-(NSString*)_methodDescription;
@end
