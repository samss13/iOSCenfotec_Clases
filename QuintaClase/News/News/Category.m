//
//  Category.m
//  News
//
//  Created by Estudiantes on 18/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "Category.h"

@interface Category()
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSMutableArray *newsArray;
@end

@implementation Category

-(id)initWithName:(NSString*) name imageName:(NSString*) imageName{
    if(self = [super init]){
        _name = name;
        _imageName = imageName;
        _newsArray = [NSMutableArray new];
    }
    return self;
}

@end
