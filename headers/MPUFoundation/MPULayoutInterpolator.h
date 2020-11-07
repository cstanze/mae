@interface MPULayoutInterpolator : NSObject <NSCopying> {
    BOOL _hasEntryWithSpecificSecondaryReferenceMetric;
}
-(id)copyWithZone:(NSZone*)arg1;
-(void)addValue:(CGFloat)arg1 forReferenceMetric:(CGFloat)arg2;
-(void)addValue:(CGFloat)arg1 forReferenceMetric:(CGFloat)arg2 secondaryReferenceMetric:(CGFloat)arg3;
-(CGFloat)valueForReferenceMetric:(CGFloat)arg1 secondaryReferenceMetric:(CGFloat)arg2;
-(CGFloat)valueForReferenceMetric:(CGFloat)arg1;
@end