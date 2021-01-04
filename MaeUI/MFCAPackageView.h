/*
 * Credit to andrewwiik/Maize for the CAML stuff. 
 * Thank you so much.
 * https://github.com/andrewwiik/Maize
*/
#import <UIKit/UIKit.h>
#import <QuartzCore/CALayer+Private.h>
#import <QuartzCore/CAPackage+Private.h>
#import <QuartzCore/CAStateController+Private.h>
#import <macros.h>

@interface MFCAPackageView : UIView {
    CAPackage *_package;
    CAStateController *_stateController;
    CALayer *_packageLayer;
}

@property(retain, nonatomic) CAPackage *package;
-(id)init;
-(id)initWithFrame:(CGRect)frame;
-(void)_setPackage:(CAPackage *)package;
-(void)setStateName:(NSString *)name;
-(void)layoutSubviews;
@end