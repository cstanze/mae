@interface _UIBackdropViewSettings : NSObject
+(id)settingsForStyle:(NSInteger)style;
@end

@interface _UIBackdropView : UIView
-(id)initWithSettings:(_UIBackdropViewSettings*)arg1;
@end

@interface MFCardBackdropView : UIView
@property(nonatomic, retain) _UIBackdropView *backdropView;
@property(nonatomic, retain) UIImageView *cutoutView;
@end
