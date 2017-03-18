//
//  CoreDataManager.h
//  News
//
//  Created by Estudiantes on 11/3/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataManager : NSObject
+(NSArray*)getAllCategories;
+(NSArray*)getNewsWithCategoryName:(NSString*)categoryName;
+(void)insertNewsWithTitle:(NSString*)title description:(NSString*)description categoryName:(NSString*)categoryName;
@end
