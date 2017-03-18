//
//  CoreDataManager.h
//  Quiz5
//
//  Created by Estudiantes on 18/3/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataManager : NSObject
+(NSArray*)getAllItems;
+(void)insertItemWithName:(NSString*)name quantity:(NSInteger)quantity date:(NSDate*)date;
@end
