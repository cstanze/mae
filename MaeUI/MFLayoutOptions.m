#import "MFLayoutOptions.h"
#import <MPUFoundation/MPULayoutInterpolator.h>
#import <UIKit/UIScreen+Private.h>
#import <QuartzCore/CALayer+Private.h>

static int isRTL = -1;
static CGFloat regularContinuousCornerRadius = 0;
static CGRect deviceBounds;
static CGFloat cachedDeviceHeight = 0;
static CGFloat cachedDeviceWidth = 0;
static CGFloat cachedStatusHeight = 0;
static CGFloat cachedRegularCornerRadius = 0;
static CGFloat cachedEdgeSize = 0;
static CGFloat cachedRoundButtonSize = 0;
static CGFloat cachedSpacingSize = 0;

MPULayoutInterpolator *roundButtonInterpolator;
MPULayoutInterpolator *spacingInterpolator;
MPULayoutInterpolator *edgeInterpolator;
MPULayoutInterpolator *regularCornerInterpolator;
MPULayoutInterpolator *statusHeightInterpolator;

@implementation MFLayoutOptions

+ (CGFloat)deviceWidth {
    static dispatch_once_t once_tok;
    dispatch_once(&once_tok, ^{
		deviceBounds = [UIScreen mainScreen].bounds;
		if (cachedDeviceWidth < 1) {
			cachedDeviceWidth = deviceBounds.size.width > deviceBounds.size.height ? deviceBounds.size.height : deviceBounds.size.width;
		}
    });
    return cachedDeviceWidth;

}

+ (CGFloat)deviceHeight {
	static dispatch_once_t once_tok;
    dispatch_once(&once_tok, ^{
		deviceBounds = [UIScreen mainScreen].bounds;
		if (cachedDeviceHeight < 1) {
			cachedDeviceHeight = deviceBounds.size.width > deviceBounds.size.height ? deviceBounds.size.width : deviceBounds.size.height;
		}
    });
	return cachedDeviceHeight;
}

+ (BOOL)isRTL {
	if (isRTL == -1) {
        if ([UIApplication sharedApplication].userInterfaceLayoutDirection == UIUserInterfaceLayoutDirectionRightToLeft) {
            isRTL = 1;
        }
        else {
            isRTL = 0;
        }
    }
    return (BOOL)isRTL;
}

+ (void)setupInterpolators {

	static dispatch_once_t once_tok;
    dispatch_once(&once_tok, ^{

    	if (NSClassFromString(@"MPULayoutInterpolator")) {

			CGFloat deviceWidth = [MFLayoutOptions deviceWidth];

            if (!spacingInterpolator) {
				spacingInterpolator = [NSClassFromString(@"MPULayoutInterpolator") new];
				[spacingInterpolator addValue:8 forReferenceMetric:320];
				[spacingInterpolator addValue:15 forReferenceMetric:375];
				[spacingInterpolator addValue:14 forReferenceMetric:414];
				[spacingInterpolator addValue:10 forReferenceMetric:768];
				cachedSpacingSize = [spacingInterpolator valueForReferenceMetric:deviceWidth];
			}

            if (!edgeInterpolator) {
				edgeInterpolator = [NSClassFromString(@"MPULayoutInterpolator") new];
				[edgeInterpolator addValue:66 forReferenceMetric:320];
				[edgeInterpolator addValue:69 forReferenceMetric:375];
				[edgeInterpolator addValue:76 forReferenceMetric:414];
				[edgeInterpolator addValue:66 forReferenceMetric:768];
				cachedEdgeSize = [edgeInterpolator valueForReferenceMetric:deviceWidth];
			}

			if (!roundButtonInterpolator) {
				roundButtonInterpolator = [NSClassFromString(@"MPULayoutInterpolator") new];
				[roundButtonInterpolator addValue:52 forReferenceMetric:320];
				[roundButtonInterpolator addValue:54 forReferenceMetric:375];
				[roundButtonInterpolator addValue:60 forReferenceMetric:414];
				[roundButtonInterpolator addValue:52 forReferenceMetric:768];
				cachedRoundButtonSize = [roundButtonInterpolator valueForReferenceMetric:deviceWidth];
			}

            if(!statusHeightInterpolator) {
                statusHeightInterpolator = [NSClassFromString(@"MPULayoutInterpolator") new];
				[statusHeightInterpolator addValue:52 forReferenceMetric:320];
				[statusHeightInterpolator addValue:54 forReferenceMetric:375];
				[statusHeightInterpolator addValue:60 forReferenceMetric:414];
				[statusHeightInterpolator addValue:52 forReferenceMetric:768];
				cachedStatusHeight = [statusHeightInterpolator valueForReferenceMetric:deviceWidth];
            }

			UIView *psuedoCornerCalculator = [[UIView alloc] initWithFrame:CGRectMake(0,0,cachedEdgeSize*2,cachedEdgeSize*2)];
			if (@available(iOS 13.0, *))
				psuedoCornerCalculator.layer.cornerCurve = kCACornerCurveContinuous;
			else
				psuedoCornerCalculator.layer.continuousCorners = YES;

			regularContinuousCornerRadius = psuedoCornerCalculator.layer.cornerRadius;
		}
	});
}

+ (CGFloat)roundButtonSize {
	if (cachedRoundButtonSize == 0) {
		[MFLayoutOptions setupInterpolators];
	}
	return cachedRoundButtonSize;
}

+ (CGFloat)regularCornerRadius {
	if (cachedRegularCornerRadius == 0) {
		[MFLayoutOptions setupInterpolators];
	}
	return cachedRegularCornerRadius;

	// 17 for small
}

+ (CGFloat)edgeSize {
	if (cachedEdgeSize == 0) {
		[MFLayoutOptions setupInterpolators];
	}

	return cachedEdgeSize;
}

+ (CGFloat)regularContinuousCornerRadius {
	if (cachedRegularCornerRadius < 1) {
		[MFLayoutOptions setupInterpolators];
	}

	return regularContinuousCornerRadius;
}

+ (CGFloat)statusHeight {
    if(cachedStatusHeight == 0) {
        [MFLayoutOptions setupInterpolators];
    }

	return cachedStatusHeight;
}

@end