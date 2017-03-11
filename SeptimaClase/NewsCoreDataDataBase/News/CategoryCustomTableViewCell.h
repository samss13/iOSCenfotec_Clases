//
//  CategoryCustomTableViewCell.h
//  News
//
//  Created by Estudiantes on 18/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDCategory.h"

@interface CategoryCustomTableViewCell : UITableViewCell
-(void)setupCustomCellWithCategory:(CDCategory*)category;
@end
