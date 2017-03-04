//
//  Category.h
//  News
//
//  Created by Estudiantes on 18/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Category : NSObject
@property (readonly) NSString *name;
@property (readonly) NSString *imageName;
@property (readonly) NSMutableArray *newsArray;

-(id)initWithName:(NSString*) name imageName:(NSString*) imageName;
@end
