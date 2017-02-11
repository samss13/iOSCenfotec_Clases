//
//  NumbersCustomTableViewCell.h
//  CustomTableViewExample
//
//  Created by Estudiantes on 11/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumbersCustomTableViewCell : UITableViewCell

-(void)setupCellWithNumber:(NSString*)number;
+(NSString*)getIndentifier;
@end
