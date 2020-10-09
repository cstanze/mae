#include "MFHandler.h"

@implementation MFHandler
-(void)actionWithFloatValue:(float)value {
    NSLog(@"%f", value);
}
-(float)floatResultFromAction {
    return 1.f;
}
@end