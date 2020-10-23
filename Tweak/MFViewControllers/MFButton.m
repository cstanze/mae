#import "MFButton.h"

@implementation MFButton
+(float)spacingForScreen:(UIScreen*)screen {
    return 32;
    // if(screen.bounds.size.height == 414) return 40;
    // if(screen.bounds.size.height == 375) return ;
    // return 42;
}
@end