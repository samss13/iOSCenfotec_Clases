//
//  UITableView+RegisterCustomCell.m
//  News
//
//  Created by Estudiantes on 18/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "UITableView+RegisterCustomCell.h"

@implementation UITableView (RegisterCustomCell)

-(void)registerCustomCellWithName:(NSString*)name{
    UINib *nib = [UINib nibWithNibName:name bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:name];
}

@end
