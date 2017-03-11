//
//  CoreDataManager.m
//  News
//
//  Created by Estudiantes on 11/3/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "CoreDataManager.h"
#import <MagicalRecord/MagicalRecord.h>
#import "CDCategory.h"
#import "CDNews.h"

@implementation CoreDataManager

+(void)saveContext{
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            NSLog(@"You successfully saved your context.");
        }else if(error){
            NSLog(@"Error saving context: %@", error.description);
        }
    }];
}

+(NSArray*)getAllCategories{
    NSArray *categories = [CDCategory MR_findAllSortedBy:@"order"                                                  ascending:YES];
    
    if (categories.count > 0) {
        return categories;
    }
    
    return [CoreDataManager insertCategories];
}

+(NSArray*) insertCategories{
    [CDCategory insertCategoryWithName:@"Sucesos" imageName:@"incident" order:2];
    [CDCategory insertCategoryWithName:@"Deportes" imageName:@"sports" order:1];
    [CDCategory insertCategoryWithName:@"Tecnologia" imageName:@"technology" order:4];
    [CDCategory insertCategoryWithName:@"Economia" imageName:@"economy" order:3];
    
    [CoreDataManager saveContext];
    
    return [CoreDataManager getAllCategories];
}

+(NSArray*)getNewsWithCategoryName:(NSString*)categoryName{
    CDCategory *category = [CDCategory MR_findFirstByAttribute:@"name" withValue:categoryName];
    
    return [category.news allObjects];
}
@end
