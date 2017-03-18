//
//  ItemCustomTableViewCell.h
//  Quiz5
//
//  Created by Estudiantes on 18/3/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Item;

@interface ItemCustomTableViewCell : UITableViewCell
-(void)loadDataCustomCellWithItem:(Item*)item;
@end
