// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDNews.m instead.

#import "_CDNews.h"

@implementation CDNewsID
@end

@implementation _CDNews

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CDNews" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CDNews";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CDNews" inManagedObjectContext:moc_];
}

- (CDNewsID*)objectID {
	return (CDNewsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic date;

@dynamic descriptionNews;

@dynamic titleNews;

@dynamic category;

@end

@implementation CDNewsAttributes 
+ (NSString *)date {
	return @"date";
}
+ (NSString *)descriptionNews {
	return @"descriptionNews";
}
+ (NSString *)titleNews {
	return @"titleNews";
}
@end

@implementation CDNewsRelationships 
+ (NSString *)category {
	return @"category";
}
@end

