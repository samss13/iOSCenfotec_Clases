//
//  UITableViewCell+GetClassName.m
//  News
//
//  Created by Estudiantes on 18/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "UITableViewCell+GetClassName.h"

@implementation UITableViewCell (GetClassName)

+(NSString*) getClassName{
    return NSStringFromClass(self);
}
@end
