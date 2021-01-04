/* External Frameworks */
    #import <spawn.h>
    #import <objc/runtime.h>
    #import <MaeCommon/MaeCommon.h>
/* Views & View Controllers */
    #import <MaeUI/MFSystemViewController.h>

@interface CCUIModularControlCenterViewController : UIViewController
+(id)sharedInstance;
@end

@interface CCUIModularControlCenterOverlayViewController : UIViewController
@property(nonatomic, retain) MFSystemViewController *controlCenter;
@property(nonatomic, retain) UIView *overlayModuleCollectionView;
@property(nonatomic, retain) UIScrollView *overlayScrollView;
@property(nonatomic, retain) UIView *overlayBackgroundView;
@property(nonatomic, retain) UIView *overlayHeaderView;
-(void)_updatePresentationForLocationY:(double)arg1;
@end

/*
 * @interface SBControlCenterController : NSObject
 *  +(id)sharedInstance;
 *  -(void)presentAnimated:(BOOL)arg1;
 *  -(void)dismissAnimated:(BOOL)arg1;
 *  -(void)presentAnimated:(BOOL)arg1 completion:(id)arg2;
 *  -(void)dismissAnimated:(BOOL)arg1 completion:(id)arg2;
 * @end
*/
