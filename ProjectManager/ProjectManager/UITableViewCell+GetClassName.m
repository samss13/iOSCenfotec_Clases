//
//  UITableViewCell+GetClassName.m
//  ProjectManager
//
//  Created by Sam Santamaria on 3/25/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import "UITableViewCell+GetClassName.h"

@implementation UITableViewCell (GetClassName)

+(NSString*) getClassName{
    return NSStringFromClass(self);
}

@end
