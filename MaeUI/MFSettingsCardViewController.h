/* Common */
    #import <MaeCommon/MaeCommon.h>
    #import "MFCardBackdropView.h"
    #import "MFRoundButton.h"
    #import "MFBaseViewController.h"

@interface UIUserInterfaceStyleArbiter
+(id)sharedInstance;
-(void)toggleCurrentStyle;
@end

@interface MFSettingsCardViewController : MFBaseScrollViewController
@property(nonatomic, retain) MFCardBackdropView *backdropView;
@end
