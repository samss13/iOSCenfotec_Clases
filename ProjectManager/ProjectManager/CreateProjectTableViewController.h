//
//  CreateProjectTableViewController.h
//  ProjectManager
//
//  Created by SYSCO on 3/27/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Proyecto;

@interface CreateProjectTableViewController : UITableViewController
@property (strong, nonatomic) Proyecto *proyectoSelected;
@end
