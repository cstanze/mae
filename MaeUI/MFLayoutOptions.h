@interface MFLayoutOptions : NSObject
+(CGFloat)deviceWidth;
+(CGFloat)deviceHeight;
+(CGFloat)roundButtonSize;

// +(CGFloat)roundButtonTitlePaddingSize;
// +(CGFloat)roundButtonSubtitlePaddingSize;
// +(CGFloat)roundButtonExpandedSideInsetSize;
+(CGFloat)regularContinuousCornerRadius;
+(CGFloat)regularCornerRadius;
+(CGFloat)statusHeight;

+(void)setupInterpolators;

+(BOOL)isRTL;

@end