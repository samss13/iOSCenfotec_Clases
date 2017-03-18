//
//  CoreDataManager.m
//  Quiz5
//
//  Created by Estudiantes on 18/3/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "CoreDataManager.h"
#import "MagicalRecord/MagicalRecord.h"
#import "Item.h"

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

+(NSArray*)getAllItems{
    NSArray *items = [Item MR_findAll];
    
    return items;
}

+(void)insertItemWithName:(NSString*)name quantity:(NSInteger)quantity date:(NSDate*)date{
    Item *item = [Item MR_createEntity];
    item.name = name;
    item.quantityValue = quantity;
    item.date = date;
    
    [CoreDataManager saveContext];
}

@end
