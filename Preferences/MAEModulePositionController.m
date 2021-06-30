#import "MAEModulePositionController.h"

@implementation MAEModulePositionController
-(instancetype)init {
  self = [super init];

  if(self) {
    _prefs = [[HBPreferences alloc] initWithIdentifier:@"com.constanze.maeprefs"];

    if([_prefs objectForKey:@"enabledModules"] == nil) {
      [_prefs setObject:@[] forKey:@"enabledModules"];
    }

    if([_prefs objectForKey:@"disabledModules"] == nil) {
      [_prefs setObject:@[] forKey:@"disabledModules"];
    }

    NSLog(@"[Mae] enabledModules = %@", [_prefs objectForKey:@"enabledModules"]);
    NSLog(@"[Mae] disabledModules = %@", [_prefs objectForKey:@"disabledModules"]);

    NSSet *_modules = [NSSet setWithArray:[_prefs objectForKey:@"enabledModules"]];
    NSSet *_disabledModules = [NSSet setWithArray:[_prefs objectForKey:@"disabledModules"]];

    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDir;
    if([fm fileExistsAtPath:@"/Library/Mae" isDirectory:&isDir] && isDir) {
      NSArray *__emod = [fm contentsOfDirectoryAtPath:@"/Library/Mae" error:nil];
      for(NSString *_emod in __emod) {
        NSBundle *fmwkBundle = [NSBundle bundleWithPath:[@"/Library/Mae/" stringByAppendingString:_emod]];
        NSString *infoPath = [fmwkBundle pathForResource:@"Info" ofType:@"plist"];
        NSDictionary *modInfo = [[NSDictionary alloc] initWithContentsOfURL:[NSURL fileURLWithPath:infoPath] error:nil];

        NSLog(@"[Mae] checking mod = %@", modInfo);

        BOOL containsMod = NO;
        for(NSString *_modId in _modules) {
          NSDictionary *_mod = [self loadModuleInfoForBundleIdentifier:_modId];
          if([_mod[@"CFBundleIdentifier"] isEqualToString:modInfo[@"CFBundleIdentifier"]])
            containsMod = YES;
        }

        if(!containsMod)
          _disabledModules = [_disabledModules setByAddingObject:modInfo[@"CFBundleIdentifier"]];
      }
    }

    modules = [[_modules allObjects] mutableCopy];
    disabledModules = [[_disabledModules allObjects] mutableCopy];
    _moduleHandles = [[NSMutableArray alloc] init];
  }

  return self;
}

-(NSDictionary*)loadModuleInfoForBundleIdentifier:(NSString*)bundleIdentifier {
  NSFileManager *fm = [NSFileManager defaultManager];
  BOOL isDir;
  if([fm fileExistsAtPath:@"/Library/Mae" isDirectory:&isDir] && isDir) {
    NSArray *__emod = [fm contentsOfDirectoryAtPath:@"/Library/Mae" error:nil];
    for(NSString *_emod in __emod) {
      NSLog(@"[Mae] found bundle name = %@", _emod);
      NSBundle *fmwkBundle = [NSBundle bundleWithPath:[@"/Library/Mae/" stringByAppendingString:_emod]];
      NSString *infoPath = [fmwkBundle pathForResource:@"Info" ofType:@"plist"];
      NSDictionary *modInfo = [[NSDictionary alloc] initWithContentsOfURL:[NSURL fileURLWithPath:infoPath] error:nil];

      NSLog(@"[Mae] found mod info = %@, with bundle id = %@", modInfo, bundleIdentifier);
      if([modInfo[@"CFBundleIdentifier"] isEqualToString:bundleIdentifier])
        return modInfo;
    }
  }

  return nil;
}

-(PSSpecifier*)createModuleSpec:(NSString*)moduleIdentifier index:(int)i {
  NSDictionary *module = [self loadModuleInfoForBundleIdentifier:moduleIdentifier];

  NSLog(@"[Mae] creating mod spec = %@", module);

  if(module == nil) {
    NSLog(@"[Mae] found nil while creating mod spec for id = %@", moduleIdentifier);
    return nil;
  }

  NSString *nsDLPath = [[@"/Library/Mae/" stringByAppendingString:module[@"CFBundleExecutable"]] stringByAppendingString:@".framework/"];
  NSBundle *specBundle = [NSBundle bundleWithPath:nsDLPath];
  [_moduleHandles insertObject:specBundle atIndex:0];
  [specBundle load];

  PSSpecifier *spec = [PSSpecifier
                        preferenceSpecifierNamed:module[@"MaeEntryDisplayName"]
                        target:self
                        set:NULL
                        get:NULL
                        detail:module[@"MaeContainsPreferencesEntry"] ? NSClassFromString(module[@"MaePreferencesEntry"]) : NSClassFromString(@"MAEDefaultModuleController")
                        cell:PSLinkCell
                        edit:nil];
  
  [spec setProperty:NSClassFromString(@"AlexaCell") forKey:PSCellClassKey];
  
  return spec;
}

-(id)specifiers {
  if(_specifiers == nil) {
    _specifiers = [self loadSpecifiersFromPlistName:@"ModulePositions" target:self];
  }

  return _specifiers;
}

-(void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  [self reload];
}

-(void)viewDidLoad {
  [super viewDidLoad];

  [self loadModuleSpecs];
  [self reload];
}

-(void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [_prefs setObject:modules forKey:@"enabledModules"];
  [_prefs setObject:disabledModules forKey:@"disabledModules"];

  for(NSBundle *bundle in _moduleHandles) {
    [bundle unload];
  }
}

-(void)tableView:(UITableView*)tableView moveRowAtIndexPath:(NSIndexPath*)atIndex toIndexPath:(NSIndexPath*)toIndex {
  NSDictionary *module = atIndex.section == 1 ? [modules objectAtIndex:atIndex.row] : [disabledModules objectAtIndex:atIndex.row];

  [modules containsObject:module] ? [modules removeObject:module] : [disabledModules removeObject:module];
  
  // I added the < bc there is the possibility of 
  // moving the row to the group used as a footer
  if([toIndex section] <= 1) {
    [modules insertObject:module atIndex:toIndex.row];
  } else {
    [disabledModules insertObject:module atIndex:toIndex.row];
  }

  [self reloadSpecifiers];
  [self loadModuleSpecs];
}

-(BOOL)tableView:(UITableView*)tableView canMoveRowAtIndexPath:(NSIndexPath*)atIndex {
  return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView*)tableView editingStyleForRowAtIndexPath:(NSIndexPath*)indexPath {
  return UITableViewCellEditingStyleNone;
}

-(BOOL)tableView:(UITableView*)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath*)atIndex {
  return NO;
}

-(BOOL)performDeletionActionForSpecifier:(id)arg1 {
  return NO;
}

-(BOOL)shouldReloadSpecifiersOnResume {
  return NO;
}

-(void)loadModuleSpecs {
  NSMutableArray *specList = [[NSMutableArray alloc] init];
  NSMutableArray *dSpecList = [[NSMutableArray alloc] init];

  for (NSString *mod in modules) {
    PSSpecifier *spec = [self createModuleSpec:mod index:[modules indexOfObject:mod]];
    if(spec != nil)
      [specList addObject:spec];
  }
  [self insertContiguousSpecifiers:specList atEndOfGroup:1];

  for (NSString *dMod in disabledModules) {
    PSSpecifier *spec = [self createModuleSpec:dMod index:[modules indexOfObject:dMod]];
    if(spec != nil)
      [dSpecList addObject:spec];
  }
  [self insertContiguousSpecifiers:dSpecList atEndOfGroup:2];
}

@end

@implementation MAEDefaultModuleController
- (instancetype)init {
  self = [super init];

  return self;
}

-(id)specifiers {
  if(_specifiers == nil) {
    _specifiers = [self loadSpecifiersFromPlistName:@"DummyModuleSettings" target:self];
  }
  return _specifiers;
}
@end
