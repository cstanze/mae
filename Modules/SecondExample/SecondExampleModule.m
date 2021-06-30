#import <UIKit/UIKit.h>
#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>

@interface SecondExampleModulePreferencesController : PSListController
@end

@interface SecondExampleModuleEntry : NSObject
@end

@implementation SecondExampleModuleEntry
-(UIView*)moduleEntry {
  return [UIView new];
}
@end

@implementation SecondExampleModulePreferencesController
- (instancetype)init {
  self = [super init];

  return self;
}

- (id)specifiers {
  if(_specifiers == nil) {
    _specifiers = [self loadSpecifiersFromPlistName:@"SecondDummyModuleSettings" target:self];
  }
  return _specifiers;
}
@end
