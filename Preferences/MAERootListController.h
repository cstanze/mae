#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBRespringController.h>
#import <Cephei/HBPreferences.h>

@interface AppearanceSettings : HBAppearanceSettings
@end

@interface MAERootListController : HBRootListController {
    UITableView *_table;
    UIRefreshControl *refreshControl;
}
@property (nonatomic, retain) UIBarButtonItem *respringButton;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIImageView *iconView;
-(void)respring;
@end
