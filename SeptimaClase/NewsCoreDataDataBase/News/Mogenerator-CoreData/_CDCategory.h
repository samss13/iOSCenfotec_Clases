// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDCategory.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class CDNews;

@interface CDCategoryID : NSManagedObjectID {}
@end

@interface _CDCategory : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CDCategoryID *objectID;

@property (nonatomic, strong, nullable) NSString* imageName;

@property (nonatomic, strong, nullable) NSString* name;

@property (nonatomic, strong, nullable) NSNumber* order;

@property (atomic) int16_t orderValue;
- (int16_t)orderValue;
- (void)setOrderValue:(int16_t)value_;

@property (nonatomic, strong, nullable) NSSet<CDNews*> *news;
- (nullable NSMutableSet<CDNews*>*)newsSet;

@end

@interface _CDCategory (NewsCoreDataGeneratedAccessors)
- (void)addNews:(NSSet<CDNews*>*)value_;
- (void)removeNews:(NSSet<CDNews*>*)value_;
- (void)addNewsObject:(CDNews*)value_;
- (void)removeNewsObject:(CDNews*)value_;

@end

@interface _CDCategory (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSString*)primitiveImageName;
- (void)setPrimitiveImageName:(nullable NSString*)value;

- (nullable NSString*)primitiveName;
- (void)setPrimitiveName:(nullable NSString*)value;

- (nullable NSNumber*)primitiveOrder;
- (void)setPrimitiveOrder:(nullable NSNumber*)value;

- (int16_t)primitiveOrderValue;
- (void)setPrimitiveOrderValue:(int16_t)value_;

- (NSMutableSet<CDNews*>*)primitiveNews;
- (void)setPrimitiveNews:(NSMutableSet<CDNews*>*)value;

@end

@interface CDCategoryAttributes: NSObject 
+ (NSString *)imageName;
+ (NSString *)name;
+ (NSString *)order;
@end

@interface CDCategoryRelationships: NSObject
+ (NSString *)news;
@end

NS_ASSUME_NONNULL_END
