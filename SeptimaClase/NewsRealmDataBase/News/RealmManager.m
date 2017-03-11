//
//  RealmManager.m
//  News
//
//  Created by Estudiantes on 4/3/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "RealmManager.h"
#import "Category.h"
#import "News.h"

@implementation RealmManager

+(RLMResults*)getAllCategories{
    RLMResults<Category *> *categories = [Category allObjects];
    
    if (categories.count>0) {
        return categories;
    }
    return [RealmManager insertCategories];
}

+(Category*)createCategoryWithName:(NSString*)name imageName:(NSString*)imageName{
    Category *category = [[Category alloc] init];
    
    category.name = name;
    category.imageName = imageName;
    
    return category;
}

+(RLMResults*)insertCategories{
    Category *firtCategory = [RealmManager createCategoryWithName:@"Sucesos" imageName:@"incident"];
    Category *secondCategory = [RealmManager createCategoryWithName:@"Deportes" imageName:@"sports"];
    Category *thirdCategory = [RealmManager createCategoryWithName:@"Tecnologia" imageName:@"technology"];
    Category *fourthCategory = [RealmManager createCategoryWithName:@"Economia" imageName:@"economy"];
    
    [RealmManager saveRealmObject:firtCategory];
    [RealmManager saveRealmObject:secondCategory];
    [RealmManager saveRealmObject:thirdCategory];
    [RealmManager saveRealmObject:fourthCategory];
    
    return [RealmManager getAllCategories];
}

+(void)saveRealmObject:(RLMObject*)realmObject{
    // Get the default Realm
    RLMRealm *realm = [RLMRealm defaultRealm];
    // You only need to do this once (per thread)
    // Add to Realm with transaction
    [realm beginWriteTransaction];
    [realm addObject:realmObject];
    [realm commitWriteTransaction];
}

+(Category*)getCategoryWithName:(NSString*)name{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    
    RLMResults<Category*> *categories = [Category objectsWithPredicate:predicate];
    
    if (categories.count > 0) {
        return categories.firstObject;
    }
    
    return nil;
}

+(void)createNewsWithTitle:(NSString*)title description:(NSString*)description category:(Category*)category{
    News* news = [News new];
    news.date = [NSDate date];
    news.title = title;
    news.newsDescription = description;
    
    [RealmManager saveRealmObject:news];
    
    RLMRealm *realm = [RLMRealm defaultRealm];

    [realm beginWriteTransaction];
    [category.news addObject:news];
    [realm commitWriteTransaction];
    
}

@end
