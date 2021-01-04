#import "MFSettingsCardViewController.h"
#import <QuartzCore/CAPackage+Private.h>

@implementation MFSettingsCardViewController
-(id)init {
  self = [super init];

  self.backdropView = [[MFCardBackdropView alloc] init];
  [self.backdropView setDark:YES];  
  [self.view addSubview:self.backdropView];

  CCSModuleRepository *moduleRepo = MSHookIvar<CCSModuleRepository*>([%c(CCSRemoteServiceProvider) sharedInstance], "_moduleRepository");
  [moduleRepo _updateAvailableModuleMetadata];

  NSDictionary *moduleMetadata = MSHookIvar<NSDictionary*>(moduleRepo, "_allModuleMetadataByIdentifier");
  NSArray *availableModules = [(NSSet*)MSHookIvar<NSSet*>(moduleRepo, "_availableModuleIdentifiers") allObjects];

  for(NSString *key in moduleMetadata) {
    if(![availableModules containsObject:key]) continue;
    CCSModuleMetadata *meta = moduleMetadata[key];
    NSBundle *moduleBundle = [NSBundle bundleWithURL:[meta moduleBundleURL]];
    [moduleBundle load];
    NSDictionary *moduleInfo = [NSDictionary dictionaryWithContentsOfURL:[moduleBundle URLForResource:@"Info" withExtension:@"plist"] error:nil];

    if([[[%c(CCSModuleSettingsProvider) sharedProvider] orderedUserEnabledModuleIdentifiers] containsObject:meta.moduleIdentifier]) {
      // Enable Module
      if([meta.moduleIdentifier isEqualToString:@"com.apple.control-center.ConnectivityModule"]) {
        CCUIConnectivityModule *module = [[NSClassFromString(moduleInfo[@"NSPrincipalClass"]) alloc] init];
        NSLog(@"[Mae] Module Init: %@", [module _methodDescription]);
        NSLog(@"[Mae] Creating module layout");
        [self layoutConnectivityModule:module];
      } else {
        // Singular setup
      }
    }
  }

  return self;
}

-(void)viewDidLayoutSubviews {
  self.backdropView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

-(void)layoutConnectivityModule:(CCUIConnectivityModule*)module {
  UIViewController *moduleContentController = [module contentViewControllerForContext:nil];
  NSLog(@"[Mae] Initialized module: %@", [module _methodDescription]);
  moduleContentController.view.frame = CGRectMake(0, 0, 150, 300);
  [self.view addSubview:moduleContentController.view];
}

@end
