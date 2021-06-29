#include "MFHandler.h"

@implementation MFHandler
+ (instancetype)sharedInstance {
    static MFHandler *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MFHandler alloc] init];
    });
    return sharedInstance;
}

-(void)actionWithFloatValue:(float)value {
    NSLog(@"%f", value);
}
-(float)floatResultFromAction {
    return 1.f;
}
@end