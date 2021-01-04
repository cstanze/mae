@protocol CCUIContentModuleContentViewController <NSObject>
@property(nonatomic, readonly) double preferredExpandedContentHeight;
@property(nonatomic, readonly) double preferredExpandedContentWidth;
@property(nonatomic, readonly) double preferredExpandedContentContinuousCornerRadius;
@property(nonatomic, readonly) BOOL providesOwnPlatter;
@property(nonatomic, readonly) UIViewPropertyAnimator *customAnimator;
@optional
-(void)willBecomeActive;
-(void)willResignActive;
-(UIViewPropertyAnimator*)customAnimator;
-(BOOL)shouldBeginTransitionToExpandedContentModule;
-(BOOL)shouldFinishTransitionToExpandedContentModule;
-(void)willTransitionToExpandedContentMode:(BOOL)arg1;
-(void)didTransitionToExpandedContentMode:(BOOL)arg1;
-(BOOL)canDismissPresentedContent;
-(void)dismissPresentedContentAnimated:(BOOL)arg1 completion:(id)arg2;
-(void)displayWillTurnOff;
-(void)controlCenterWillPresent;
-(void)controlCenterDidDismiss;
-(double)preferredExpandedContentWidth;
-(double)preferredExpandedContentContinuousCornerRadius;
-(BOOL)providesOwnPlatter;
@required
-(double)preferredExpandedContentHeight;
@end

@protocol CCUIContentModuleBackgroundViewController <NSObject>
@optional
-(CGRect*)effectiveContentFrameForContainerFrame:(CGRect)arg1;
@end

@interface CCUIConnectivityModule : NSObject
@property (readonly, nonatomic) UIViewController<CCUIContentModuleContentViewController>* contentViewController;
@property (readonly, nonatomic) UIViewController<CCUIContentModuleBackgroundViewController>* backgroundViewController;
-(id)contentViewControllerForContext:(id)arg1;
@end
