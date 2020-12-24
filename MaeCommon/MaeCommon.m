#import "MaeCommon.hh"

void loadPrefs() {
    prefs = [[HBPreferences alloc] initWithIdentifier:@"com.constanze.maeprefs"];
    [prefs registerBool:&maeEnabled default:YES forKey:@"maeEnabled"];
    [prefs registerBool:&plattersDark default:YES forKey:@"plattersDark"];
}
