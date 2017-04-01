//
//  ListProjectsCustomTableViewCell.h
//  ProjectManager
//
//  Created by Sam Santamaria on 3/25/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Proyecto;

@interface ListProjectsCustomTableViewCell : UITableViewCell
-(void)setupCustomCellWithProject:(Proyecto*)project;
@end
