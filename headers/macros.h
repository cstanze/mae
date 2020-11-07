/*
 * https://github.com/andrewwiik/Maize
 * https://github.com/andrewwiik/Maize/blob/master/headers/macros.h
 * 
 * This file isn't completely copied from the original source because yes.
*/

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_RTL (ui_isRTL())

/* Extern */

#ifdef __cplusplus
extern "C" {}
#endif

CGPoint UIRectGetCenter(CGRect rect);

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void);

#ifdef __cplusplus
}
#endif

/* Macro Variables */
static int rtl_cache;

/* Macro Functions */
static inline unsigned int intFromHex(NSString *hex) {
    unsigned int hxi = 0;
    
    NSScanner *scanner = [NSScanner scannerWithString:hex];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hxi];

    return hxi;
}

static inline UIColor* colorFromHex(NSString *hex) {
    unsigned int hxi = intFromHex(hex);

    UIColor *color = [UIColor 
        colorWithRed: ((CGFloat)((hxi & 0xFF0000) >> 16))/255
        green: ((CGFloat)((hxi & 0xFF00) >> 8))/255
        blue: ((CGFloat)(hxi & 0xFF))/255
        alpha:1.0
    ];

    return color;
}

static inline BOOL ui_isRTL() {
    if (rtl_cache == -1) {
        if([UIApplication sharedApplication].userInterfaceLayoutDirection == UIUserInterfaceLayoutDirectionRightToLeft) {
            rtl_cache = 1;
        } else {
            rtl_cache = false;
        }
    }
    return (BOOL)rtl_cache;
}