#import "MAERootListController.h"

// 128, 116, 210 #8074d2

@implementation AppearanceSettings
-(UIColor *)tintColor {
    return [UIColor colorWithRed:128/255.f green:116/255.f blue:210/255.f alpha:1.0];
}

-(UIColor *)statusBarTintColor {
    return [UIColor whiteColor];
}

-(UIColor *)navigationBarTitleColor {
    return [UIColor whiteColor];
}

-(UIColor *)navigationBarTintColor {
    return [UIColor whiteColor];
}

-(UIColor *)tableViewCellSeparatorColor {
    return [UIColor colorWithWhite:0 alpha:0];
}

-(UIColor *)navigationBarBackgroundColor {
    return [UIColor colorWithRed:128/255.f green:116/255.f blue:210/255.f alpha:1.0];
}

-(BOOL)translucentNavigationBar {
    return NO;
}

-(HBAppearanceSettingsLargeTitleStyle)largeTitleStyle {
    return HBAppearanceSettingsLargeTitleStyleNever;
}
@end