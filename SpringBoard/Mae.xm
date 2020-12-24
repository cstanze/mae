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
    __strong static id _sharedRepository;

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
%property(nonatomic, retain) MFSystemViewController *controlCenterX;
-(void)viewDidLoad {
    %orig;
    CCSModuleRepository *moduleRepo = [[%c(CCSRemoteServiceProvider) sharedInstance] valueForKey:@"_moduleRepository"];
    (void)[moduleRepo _loadAllModuleMetadata];
    self.overlayBackgroundView.tag = 2912;
    self.overlayBackgroundView.hidden = YES;

    self.overlayHeaderView.hidden = YES;

    self.controlCenterX = [[MFSystemViewController alloc] init];
    self.controlCenterX.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    for(UIView *subview in self.overlayScrollView.subviews){
        [subview removeFromSuperview];
    }

    [self.overlayScrollView addSubview:self.controlCenterX.view];
    [self.overlayScrollView sendSubviewToBack:self.controlCenterX.view];
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

%hook CCSModuleRepository
-(id)init {
    return _sharedRepository = %orig;
}

%new
+(id)sharedInstance {
	return _sharedRepository;
}

%new
-(id)_loadAllModuleMetadata {
	NSMutableArray *modulesDict = [NSMutableArray new];
	for (NSURL *repositoryURL in [self valueForKey:@"_directoryURLs"]) {
		NSError *error = nil;
		NSArray *bundleURLs = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:repositoryURL includingPropertiesForKeys:nil options:(NSDirectoryEnumerationSkipsHiddenFiles) error:&error];

		if (bundleURLs) {
			for (NSURL *bundleURL in bundleURLs) {
				if ([[bundleURL pathExtension] caseInsensitiveCompare:@"bundle"] == NSOrderedSame) {
					CCSModuleMetadata *metadata = [%c(CCSModuleMetadata) metadataForBundleAtURL:bundleURL];
					NSLog(@"[Mae] Module: %@, visibility: %llu", metadata.moduleIdentifier, metadata.visibilityPreference);
				}
			}
		}
	}

	return modulesDict;
}
%end

%ctor {
    loadPrefs();
    if(maeEnabled)
        %init;
}