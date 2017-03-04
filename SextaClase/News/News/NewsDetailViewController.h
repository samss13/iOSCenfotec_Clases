//
//  NewsDetailViewController.h
//  News
//
//  Created by Estudiantes on 25/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Category;

@interface NewsDetailViewController : UITableViewController
@property (strong, nonatomic) Category *categorySelected;
@end
