@interface _UIBackdropViewSettings : NSObject
+(id)settingsForStyle:(NSInteger)style;
@end

@interface _UIBackdropView : UIView
-(id)initWithSettings:(_UIBackdropViewSettings*)arg1;
@end

@interface MTMaterialView : UIView
+(id)materialViewWithRecipe:(long long)arg1 configuration:(long long)arg2;
+(id)materialViewWithRecipe:(long long)arg1 configuration:(long long)arg2 initialWeighting:(double)arg3;
+(id)materialViewWithRecipeNamed:(id)arg1 inBundle:(id)arg2 configuration:(long long)arg2 initialWeighting:(double)arg3 scaleAdjustment:(/* ^block */id)arg4;
-(void)setBlurEnabled:(BOOL)arg1;
-(BOOL)isBlurEnabled;
-(NSString *)recipeName;
-(void)setRecipeName:(NSString *)name;
@end

@interface MFCardBackdropView : UIView
@property(nonatomic, retain) MTMaterialView *backdropView;
@property(nonatomic, retain) UIImageView *cutoutView;
-(void)setDark:(BOOL)dark;
@end
