//
//  Category.h
//  News
//
//  Created by Estudiantes on 18/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "News.h"

@interface Category : RLMObject
@property NSString *name;
@property NSString *imageName;
@property RLMArray<News *><News> *news;
@end
RLM_ARRAY_TYPE(Category)
