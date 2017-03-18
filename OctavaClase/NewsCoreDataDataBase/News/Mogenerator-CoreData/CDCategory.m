#import "CDCategory.h"

@interface CDCategory ()

// Private interface goes here.

@end

@implementation CDCategory

// Custom logic goes here.

+(id)insertCategoryWithName:(NSString*)name imageName:(NSString*)imageName order:(NSInteger)order{
    CDCategory *category = [CDCategory MR_createEntity];
    category.name = name;
    category.orderValue = order;
    category.imageName = imageName;
    
    return category;
}

@end
