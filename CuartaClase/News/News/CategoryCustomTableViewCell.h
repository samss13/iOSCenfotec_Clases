//
//  CategoryCustomTableViewCell.h
//  News
//
//  Created by Estudiantes on 18/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Category;

@interface CategoryCustomTableViewCell : UITableViewCell
-(void)setupCustomCellWithCategory:(Category*)category;
@end
