#import "MAEModulePositionController.h"

@implementation MAEModulePositionController
-(instancetype)init {
  self = [super init];

  if(self) {
    _prefs = [[HBPreferences alloc] initWithIdentifier:@"com.constanze.maeprefs"];

    if([_prefs objectForKey:@"enabledModules"] == nil) {
      [_prefs setObject:@"Connectivity,Sliders,Toggles,Media,Weather,Power,Battery" forKey:@"enabledModules"];
    }

    if([_prefs objectForKey:@"disabledModules"] == nil) {
      [_prefs setObject:@"" forKey:@"disabledModules"];
    }

    modules = [[[_prefs objectForKey:@"enabledModules"] componentsSeparatedByString:@","] mutableCopy];
    disabledModules = [[[_prefs objectForKey:@"disabledModules"] componentsSeparatedByString:@","] mutableCopy];

    NSLog(@"[Mae] modules = %@", modules);
    NSLog(@"[Mae] disabledModules = %@", disabledModules);

    NSLog(@"[Mae] objectForKey modules = %@", [_prefs objectForKey:@"enabledModules"]);
    NSLog(@"[Mae] objectForKey disabledModules = %@", [_prefs objectForKey:@"disabledModules"]);

    [modules removeObject:@""];
    [disabledModules removeObject:@""];
  }

  return self;
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
  [_prefs setObject:[modules componentsJoinedByString:@","] forKey:@"enabledModules"];
  [_prefs setObject:[disabledModules componentsJoinedByString:@","] forKey:@"disabledModules"];
}

-(void)loadModuleSpecs {
  NSMutableArray *specList = [[NSMutableArray alloc] init];
  NSMutableArray *dSpecList = [[NSMutableArray alloc] init];

  for (NSString *mod in modules) {
    [specList addObject:[self createModuleSpec:mod]];
  }
  [self insertContiguousSpecifiers:specList atEndOfGroup:1];

  for (NSString *dMod in disabledModules) {
    [dSpecList addObject:[self createModuleSpec:dMod]];
  }
  [self insertContiguousSpecifiers:dSpecList atEndOfGroup:2];
}

-(PSSpecifier*)createModuleSpec:(NSString*)module {
  PSSpecifier *spec = [PSSpecifier
                        preferenceSpecifierNamed:module
                        target:self
                        set:NULL
                        get:NULL
                        detail:nil
                        cell:PSLinkCell
                        edit:NSClassFromString(@"MAEModuleController")];
  
  [spec setProperty:NSClassFromString(@"AlexaCell") forKey:PSCellClassKey];
  
  return spec;
}

-(void)tableView:(UITableView*)tableView moveRowAtIndexPath:(NSIndexPath*)atIndex toIndexPath:(NSIndexPath*)toIndex {
  NSString *module = atIndex.section == 1 ? [modules objectAtIndex:atIndex.row] : [disabledModules objectAtIndex:atIndex.row];

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

@end

@implementation MAEModuleController
-(id)specifiers {
  if(_specifiers == nil) {
    _specifiers = [self loadSpecifiersFromPlistName:@"DummyModuleSettings" target:self];
  }
  return _specifiers;
}
@end
