#import "_CDCategory.h"
#import <MagicalRecord/MagicalRecord.h>

@interface CDCategory : _CDCategory
// Custom logic goes here.
+(id)insertCategoryWithName:(NSString*)name imageName:(NSString*)imageName order:(NSInteger)order;
@end
