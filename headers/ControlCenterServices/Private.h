@interface CCSModuleRepository : NSObject {
    NSArray *_directoryURLs;
    NSDictionary *_alllModuleMetadataByIdentifier;
}
-(void)_updateAvailableModuleMetadata;
@end

@interface CCSModuleMetadata : NSObject
@property (nonatomic, copy, readonly) NSString *moduleIdentifier;
@property (nonatomic, copy, readonly) NSString *associatedBundleIdentifier;
@property (nonatomic, readonly) unsigned long long visibilityPreference;
-(NSURL*)moduleBundleURL;
@end

@interface CCSRemoteServiceProvider : NSObject {
    CCSModuleRepository *_moduleRepository;
}
+(id)sharedInstance;
@end

@interface CCSModuleSettingsProvider {
    NSArray* _orderedUserEnabledModuleIdentifiers;
	NSArray* _userDisabledModuleIdentifiers;
}
@property (nonatomic,copy,readonly) NSArray * orderedUserEnabledModuleIdentifiers;
@property (nonatomic,copy,readonly) NSArray * userDisabledModuleIdentifiers;
+(id)sharedProvider;
-(NSArray *)orderedUserEnabledModuleIdentifiers;
-(NSArray *)userDisabledModuleIdentifiers;
@end

@interface CCSControlCenterService
+(id)sharedInstance;
-(void)requestEnableModuleWithIdentifier:(id)arg1 completionHandler:(id)arg2;
-(void)requestAvailableModuleIdentifiersWithCompletionHandler:(id)arg1;
-(void)getEnabledStateOfModuleWithIdentifier:(id)arg1 completionHandler:(id)arg2;
-(void)presentModuleWithIdentifier:(id)arg1 options:(id)arg2 completionHandler:(id)arg3;
@end
