/*
 * Mae.xm
 * Mae
 * 
 * Constanze (c) 2020
 * DrunkProgramer (c) 2020
 */
#import "Mae.h"
#import <AudioToolbox/AudioToolbox.h>

/* CCUIModularControlCenterViewController object */
    __strong static id _sharedOverlayObject;

%hook CCUIScrollView
-(void)setContentInset:(UIEdgeInsets)arg1 {
    %orig(UIEdgeInsetsMake(0, 0, 0, 0));
}
%end

%hook CCUIModularControlCenterOverlayViewController
%property(nonatomic, retain) MFSystemViewController *controlCenter;
%property(nonatomic, retain) MFCardBackdropView *backdropView;
-(id)init {
    return _sharedOverlayObject = %orig;
}

%new
+(id)sharedInstance {
    return _sharedOverlayObject;
}

-(void)viewDidLoad {
    %orig;
    NSLog(@"[Mae] viewDidLoad. prepping cc");
    // CCSModuleRepository *moduleRepo = MSHookIvar<CCSModuleRepository*>([%c(CCSRemoteServiceProvider) sharedInstance], "_moduleRepository");
    // [moduleRepo _updateAvailableModuleMetadata];
    // NSDictionary *moduleMetadata = MSHookIvar<NSDictionary*>(moduleRepo, "_allModuleMetadataByIdentifier");
    // NSLog(@"[Mae] availableModules:");
    // NSArray *availableModules = [(NSSet*)MSHookIvar<NSSet*>(moduleRepo, "_availableModuleIdentifiers") allObjects];
    // for(NSString *module in availableModules) {
    //     NSLog(@"[Mae] \t%@", module);
    // }
    // NSLog(@"[Mae]");

    // for(NSString *key in moduleMetadata) {
    //     if(![availableModules containsObject:key]) continue;
    //     CCSModuleMetadata *meta = moduleMetadata[key];
    //     NSBundle *moduleBundle = [NSBundle bundleWithURL:[meta moduleBundleURL]];
    //     [moduleBundle load];
    //     NSDictionary *moduleInfo = [NSDictionary dictionaryWithContentsOfURL:[moduleBundle URLForResource:@"Info" withExtension:@"plist"] error:nil];

    //     Class principalClass = objc_getClass([moduleInfo[@"NSPrincipalClass"] UTF8String]);

    //     NSLog(@"[Mae] %@ <=> %@", meta.moduleIdentifier, [principalClass performSelector:@selector(_methodDescription)]);

    //     if([[[%c(CCSModuleSettingsProvider) sharedProvider] orderedUserEnabledModuleIdentifiers] containsObject:meta.moduleIdentifier])
    //         NSLog(@"[Mae] Enabled module: %@ <=> %@", meta.moduleIdentifier, NSStringFromClass([principalClass superclass]));
    // }
    
    self.overlayBackgroundView.tag = 2912;
    self.overlayBackgroundView.hidden = YES;

    self.overlayHeaderView.hidden = YES;

    self.controlCenter = [[MFSystemViewController alloc] init];
    self.controlCenter.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    for(UIView *subview in self.overlayScrollView.subviews) {
        [subview removeFromSuperview];
    }

    [self.overlayScrollView addSubview:self.controlCenter.view];
    [self.overlayScrollView sendSubviewToBack:self.controlCenter.view];
    [self.overlayScrollView setScrollEnabled:NO];

    [MSHookIvar<CCUIScrollView*>(self, "_scrollView") setScrollEnabled:NO];
}
%end

// %hook MTMaterialView
// -(void)setWeighting:(CGFloat)arg1 {
//     %orig;
//     if(self.tag == 2912)
//         [[MFSystemViewController sharedInstance] setRevealProgress:arg1];
// }
// %end

%hook SBControlCenterController
-(void)grabberTongueBeganPulling:(id)arg1 withDistance:(CGFloat)distance andVelocity:(CGFloat)arg3 andGesture:(id)arg4 {
    // %orig;
    [[MFSystemViewController sharedInstance] setTravelDistance:distance];
}

-(void)grabberTongueUpdatedPulling:(id)arg1 withDistance:(CGFloat)distance andVelocity:(CGFloat)arg3 andGesture:(id)arg4 {
    // %orig;
    [[MFSystemViewController sharedInstance] setTravelDistance:distance];
}

-(void)grabberTongueEndedPulling:(id)arg1 withDistance:(CGFloat)distance andVelocity:(CGFloat)arg3 andGesture:(id)arg4 {
    // %orig;
    [[MFSystemViewController sharedInstance] setTravelDistance:distance withStop:YES];
}
%end

// %hook CCSModuleRepository

// %new
// -(id)_loadAllModuleMetadata {
// 	NSMutableArray *modulesDict = [NSMutableArray new];
// 	for (NSURL *repositoryURL in [self valueForKey:@"_directoryURLs"]) {
// 		NSError *error = nil;
// 		NSArray *bundleURLs = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:repositoryURL includingPropertiesForKeys:nil options:(NSDirectoryEnumerationSkipsHiddenFiles) error:&error];

// 		if (bundleURLs) {
// 			for (NSURL *bundleURL in bundleURLs) {
// 				if ([[bundleURL pathExtension] caseInsensitiveCompare:@"bundle"] == NSOrderedSame) {
// 					CCSModuleMetadata *metadata = [%c(CCSModuleMetadata) metadataForBundleAtURL:bundleURL];
// 					NSLog(@"[Mae] Module: %@, visibility: %llu", metadata.moduleIdentifier, metadata.visibilityPreference);
// 				}
// 			}
// 		}
// 	}

// 	return modulesDict;
// }
// %end
