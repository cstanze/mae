#line 1 "Mae.xm"







#import "Mae.h"

    __strong static id _sharedObject;

    static BOOL maeEnabled;


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class MTMaterialView; @class CCSModuleRepository; @class CCUIModularControlCenterViewController; @class CCUIModularControlCenterOverlayViewController; 
static CCUIModularControlCenterViewController* (*_logos_orig$_ungrouped$CCUIModularControlCenterViewController$init)(_LOGOS_SELF_TYPE_INIT CCUIModularControlCenterViewController*, SEL) _LOGOS_RETURN_RETAINED; static CCUIModularControlCenterViewController* _logos_method$_ungrouped$CCUIModularControlCenterViewController$init(_LOGOS_SELF_TYPE_INIT CCUIModularControlCenterViewController*, SEL) _LOGOS_RETURN_RETAINED; static id _logos_meta_method$_ungrouped$CCUIModularControlCenterViewController$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$CCUIModularControlCenterOverlayViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL CCUIModularControlCenterOverlayViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$CCUIModularControlCenterOverlayViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL CCUIModularControlCenterOverlayViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$MTMaterialView$setWeighting$)(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST, SEL, CGFloat); static void _logos_method$_ungrouped$MTMaterialView$setWeighting$(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST, SEL, CGFloat); static id (*_logos_orig$_ungrouped$CCSModuleRepository$_loadAllModuleMetadata)(_LOGOS_SELF_TYPE_NORMAL CCSModuleRepository* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$CCSModuleRepository$_loadAllModuleMetadata(_LOGOS_SELF_TYPE_NORMAL CCSModuleRepository* _LOGOS_SELF_CONST, SEL); 

#line 14 "Mae.xm"

static CCUIModularControlCenterViewController* _logos_method$_ungrouped$CCUIModularControlCenterViewController$init(_LOGOS_SELF_TYPE_INIT CCUIModularControlCenterViewController* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
    return _sharedObject = _logos_orig$_ungrouped$CCUIModularControlCenterViewController$init(self, _cmd);
}


static id _logos_meta_method$_ungrouped$CCUIModularControlCenterViewController$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return _sharedObject;
}



__attribute__((used)) static MFSystemViewController * _logos_method$_ungrouped$CCUIModularControlCenterOverlayViewController$controlCenterX(CCUIModularControlCenterOverlayViewController * __unused self, SEL __unused _cmd) { return (MFSystemViewController *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$CCUIModularControlCenterOverlayViewController$controlCenterX); }; __attribute__((used)) static void _logos_method$_ungrouped$CCUIModularControlCenterOverlayViewController$setControlCenterX(CCUIModularControlCenterOverlayViewController * __unused self, SEL __unused _cmd, MFSystemViewController * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$CCUIModularControlCenterOverlayViewController$controlCenterX, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
static void _logos_method$_ungrouped$CCUIModularControlCenterOverlayViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL CCUIModularControlCenterOverlayViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$CCUIModularControlCenterOverlayViewController$viewDidLoad(self, _cmd);
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



static void _logos_method$_ungrouped$MTMaterialView$setWeighting$(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGFloat arg1) {
    _logos_orig$_ungrouped$MTMaterialView$setWeighting$(self, _cmd, arg1);
    if(self.tag == 2912)
        [[MFSystemViewController sharedInstance] setRevealProgress:arg1];
}



static id _logos_method$_ungrouped$CCSModuleRepository$_loadAllModuleMetadata(_LOGOS_SELF_TYPE_NORMAL CCSModuleRepository* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
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


void loadPrefs() {
    HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.constanze.maeprefs"];
    [prefs registerBool:&maeEnabled default:YES forKey:@"maeEnabled"];
}

static __attribute__((constructor)) void _logosLocalCtor_5f2c3a91(int __unused argc, char __unused **argv, char __unused **envp) {
    loadPrefs();
    if(maeEnabled)
        {Class _logos_class$_ungrouped$CCUIModularControlCenterViewController = objc_getClass("CCUIModularControlCenterViewController"); Class _logos_metaclass$_ungrouped$CCUIModularControlCenterViewController = object_getClass(_logos_class$_ungrouped$CCUIModularControlCenterViewController); { MSHookMessageEx(_logos_class$_ungrouped$CCUIModularControlCenterViewController, @selector(init), (IMP)&_logos_method$_ungrouped$CCUIModularControlCenterViewController$init, (IMP*)&_logos_orig$_ungrouped$CCUIModularControlCenterViewController$init);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_metaclass$_ungrouped$CCUIModularControlCenterViewController, @selector(sharedInstance), (IMP)&_logos_meta_method$_ungrouped$CCUIModularControlCenterViewController$sharedInstance, _typeEncoding); }Class _logos_class$_ungrouped$CCUIModularControlCenterOverlayViewController = objc_getClass("CCUIModularControlCenterOverlayViewController"); { MSHookMessageEx(_logos_class$_ungrouped$CCUIModularControlCenterOverlayViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$CCUIModularControlCenterOverlayViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$CCUIModularControlCenterOverlayViewController$viewDidLoad);}{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(MFSystemViewController *)); class_addMethod(_logos_class$_ungrouped$CCUIModularControlCenterOverlayViewController, @selector(controlCenterX), (IMP)&_logos_method$_ungrouped$CCUIModularControlCenterOverlayViewController$controlCenterX, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(MFSystemViewController *)); class_addMethod(_logos_class$_ungrouped$CCUIModularControlCenterOverlayViewController, @selector(setControlCenterX:), (IMP)&_logos_method$_ungrouped$CCUIModularControlCenterOverlayViewController$setControlCenterX, _typeEncoding); } Class _logos_class$_ungrouped$MTMaterialView = objc_getClass("MTMaterialView"); { MSHookMessageEx(_logos_class$_ungrouped$MTMaterialView, @selector(setWeighting:), (IMP)&_logos_method$_ungrouped$MTMaterialView$setWeighting$, (IMP*)&_logos_orig$_ungrouped$MTMaterialView$setWeighting$);}Class _logos_class$_ungrouped$CCSModuleRepository = objc_getClass("CCSModuleRepository"); { MSHookMessageEx(_logos_class$_ungrouped$CCSModuleRepository, @selector(_loadAllModuleMetadata), (IMP)&_logos_method$_ungrouped$CCSModuleRepository$_loadAllModuleMetadata, (IMP*)&_logos_orig$_ungrouped$CCSModuleRepository$_loadAllModuleMetadata);}}
}
