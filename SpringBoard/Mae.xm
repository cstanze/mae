/*
 * Mae.xm
 * Mae
 * 
 * Constanze (c) 2020
 * Julius Nieves (c) 2020 
 * DrunkProgramer (c) 2020
 */
#import "Mae.h"

/* CCUIModularControlCenterViewController object */
    __strong static id _sharedObject;

%hook CCUIScrollView
-(void)setContentInset:(UIEdgeInsets)arg1 {
    %orig(UIEdgeInsetsMake(0, 0, 0, 0));
}
%end


%hook CCUIModularControlCenterViewController
-(id)init {
    return _sharedObject = %orig;
}

%new
+(id)sharedInstance {
	return _sharedObject;
}
%end

%hook CCUIModularControlCenterOverlayViewController
%property(nonatomic, retain) MFSystemViewController *controlCenter;
-(void)viewDidLoad {
    %orig;
    CCSModuleRepository *moduleRepo = MSHookIvar<CCSModuleRepository*>([%c(CCSRemoteServiceProvider) sharedInstance], "_moduleRepository");
    NSDictionary *moduleMetadata = MSHookIvar<NSDictionary*>(moduleRepo, "_allModuleMetadataByIdentifier");

    for(NSString *key in moduleMetadata) {
        CCSModuleMetadata *meta = moduleMetadata[key];
        NSBundle *moduleBundle = [NSBundle bundleWithURL:[meta moduleBundleURL]];
        [moduleBundle load];
        NSDictionary *moduleInfo = [NSDictionary dictionaryWithContentsOfURL:[moduleBundle URLForResource:@"Info" withExtension:@"plist"] error:nil];

        Class principalClass = objc_getClass([moduleInfo[@"NSPrincipalClass"] UTF8String]);

        NSLog(@"[Mae] module: %@\n\tvisibility: %llu\n\tprincipalClass: %@\n\tprincipalSuperclass: %@", meta.moduleIdentifier, meta.visibilityPreference, moduleInfo[@"NSPrincipalClass"], NSStringFromClass([principalClass superclass]));
    }
    
    self.overlayBackgroundView.tag = 2912;
    self.overlayBackgroundView.hidden = YES;

    self.overlayHeaderView.hidden = YES;

    self.controlCenter = [[MFSystemViewController alloc] init];
    self.controlCenter.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    for(UIView *subview in self.overlayScrollView.subviews){
        [subview removeFromSuperview];
    }

    [self.overlayScrollView addSubview:self.controlCenter.view];
    [self.overlayScrollView sendSubviewToBack:self.controlCenter.view];
    [self.overlayScrollView setScrollEnabled:NO];
}
%end

%hook MTMaterialView
-(void)setWeighting:(CGFloat)arg1 {
    %orig;
    if(self.tag == 2912)
        [[MFSystemViewController sharedInstance] setRevealProgress:(arg1 > 1.01 ? 1.0 : arg1)];
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
