/* External Frameworks */
    #import <spawn.h>
    #import <MaeCommon/MaeCommon.hh>
/* Views & View Controllers */
    #import <MaeUI/MFSystemViewController.h>

@interface CCUIModularControlCenterViewController : UIViewController
+(id)sharedInstance;
@end

@interface CCUIModularControlCenterOverlayViewController : UIViewController
@property(nonatomic, retain) MFSystemViewController *controlCenterX;
@property(nonatomic, retain) UIView *overlayModuleCollectionView;
@property(nonatomic, retain) UIScrollView *overlayScrollView;
@property(nonatomic, retain) UIView *overlayBackgroundView;
@property(nonatomic, retain) UIView *overlayHeaderView;
-(void)_updatePresentationForLocationY:(double)arg1;
@end

@interface CCSModuleRepository : NSObject {
    NSArray *_directoryURLs;
}
+(id)sharedInstance;
-(id)_loadAllModuleMetadata;
@end

@interface CCSModuleMetadata : NSObject
+(instancetype)metadataForBundleAtURL:(id)arg1 ;
@property (nonatomic, copy, readonly) NSString *moduleIdentifier;
@property (nonatomic, readonly) unsigned long long visibilityPreference;
@end

@interface CCSRemoteServiceProvider : NSObject {
    CCSModuleRepository *_moduleRepository;
}
+(id)sharedInstance;
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