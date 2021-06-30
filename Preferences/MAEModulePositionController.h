#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBRespringController.h>
#import <Cephei/HBPreferences.h>

@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;

@optional
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1;
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 inTableView:(id)arg2;
@end

@interface PSListController (AlexandraPrefs)
-(void)_moveSpecifierAtIndex:(unsigned long long)arg1 toIndex:(unsigned long long)arg2 animated:(bool)arg3;
@end

@interface PSEditableListController : PSListController
-(void)editDoneTapped;
-(BOOL)editable;
@end

@interface MAEModulePositionController : PSEditableListController {
  NSMutableArray *modules;
  NSMutableArray *disabledModules;
  NSMutableArray *_moduleHandles;
}
@property HBPreferences *prefs;
@end

@interface MAEDefaultModuleController : PSListController
@end
