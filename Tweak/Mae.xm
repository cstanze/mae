/*
 * Mae.xm
 * Mae
 * 
 * ConstanzeDev (c) 2020 
 * Julius Nieves (c) 2020 
 */
#import "Mae.h"
/* CCUIModularControlCenterViewController object */
    __strong static id _sharedObject;
/* Preferences */
    static BOOL maeEnabled;

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
    self.overlayBackgroundView.tag = 2912;
    self.overlayBackgroundView.hidden = TRUE;

    self.overlayHeaderView.hidden = TRUE;

    self.controlCenterX = [[MFSystemViewController alloc] init];
    self.controlCenterX.view.frame = CGRectMake(0, -self.overlayHeaderView.frame.size.height + 13.5, self.view.frame.size.width, self.view.frame.size.height);

    for(UIView *subview in self.overlayScrollView.subviews){
        [subview removeFromSuperview];
    }

    [self.overlayScrollView addSubview:self.controlCenterX.view];
    [self.overlayScrollView sendSubviewToBack:self.controlCenterX.view];
    [self.overlayScrollView setScrollEnabled: NO];
}
%end

%hook MTMaterialView
-(void)setWeighting:(CGFloat)arg1 {
    %orig;
    if(self.tag == 2912)
        [[MFSystemViewController sharedInstance] setRevealProgress:arg1];
}
%end

%hook CCSModuleRepository
- (id)_loadAllModuleMetadata {
	NSArray *_directoryURLs = [self valueForKey:@"_directoryURLs"];
	NSMutableArray *modulesDict = [NSMutableArray new];
	for (NSURL *repositoryURL in _directoryURLs) {
		NSError *error = nil;
		NSArray *bundleURLs = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:repositoryURL
															includingPropertiesForKeys:nil
                   															   options:(NSDirectoryEnumerationSkipsHiddenFiles)
                   																 error:&error];

		if (bundleURLs) {
			for (NSURL *bundleURL in bundleURLs) {
				if ([[bundleURL pathExtension] caseInsensitiveCompare:@"bundle"] == NSOrderedSame) {
					CCSModuleMetadata *metadata = [NSClassFromString(@"CCSModuleMetadata") metadataForBundleAtURL:bundleURL];
					if (metadata) {
						[modulesDict addObject: metadata];

					}
				}
			}
		}
	}

	return modulesDict;
}
%end

void loadPrefs() {
    HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.constanze.maeprefs"];
    [prefs registerBool:&maeEnabled default:YES forKey:@"maeEnabled"];
}

%ctor {
    loadPrefs();
    if(maeEnabled)
        %init();
}