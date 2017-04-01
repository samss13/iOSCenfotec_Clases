//
//  UITableView+RegisterCustomCell.m
//  ProjectManager
//
//  Created by Sam Santamaria on 3/25/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import "UITableView+RegisterCustomCell.h"

@implementation UITableView (RegisterCustomCell)

-(void)registerCustomCellWithName:(NSString*)name{
    UINib *nib = [UINib nibWithNibName:name bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:name];
}

@end
