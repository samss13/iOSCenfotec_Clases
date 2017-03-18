// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDCategory.m instead.

#import "_CDCategory.h"

@implementation CDCategoryID
@end

@implementation _CDCategory

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CDCategory" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CDCategory";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CDCategory" inManagedObjectContext:moc_];
}

- (CDCategoryID*)objectID {
	return (CDCategoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"orderValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"order"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic imageName;

@dynamic name;

@dynamic order;

- (int16_t)orderValue {
	NSNumber *result = [self order];
	return [result shortValue];
}

- (void)setOrderValue:(int16_t)value_ {
	[self setOrder:@(value_)];
}

- (int16_t)primitiveOrderValue {
	NSNumber *result = [self primitiveOrder];
	return [result shortValue];
}

- (void)setPrimitiveOrderValue:(int16_t)value_ {
	[self setPrimitiveOrder:@(value_)];
}

@dynamic news;

- (NSMutableSet<CDNews*>*)newsSet {
	[self willAccessValueForKey:@"news"];

	NSMutableSet<CDNews*> *result = (NSMutableSet<CDNews*>*)[self mutableSetValueForKey:@"news"];

	[self didAccessValueForKey:@"news"];
	return result;
}

@end

@implementation CDCategoryAttributes 
+ (NSString *)imageName {
	return @"imageName";
}
+ (NSString *)name {
	return @"name";
}
+ (NSString *)order {
	return @"order";
}
@end

@implementation CDCategoryRelationships 
+ (NSString *)news {
	return @"news";
}
@end

