//
//  News.h
//  News
//
//  Created by Estudiantes on 25/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@class Category;

@interface News : RLMObject
@property NSDate *date;
@property NSString *title;
@property NSString *newsDescription;
@property Category *category;
@end
RLM_ARRAY_TYPE(News)
