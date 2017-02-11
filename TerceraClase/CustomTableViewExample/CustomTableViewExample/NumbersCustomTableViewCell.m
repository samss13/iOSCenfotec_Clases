//
//  NumbersCustomTableViewCell.m
//  CustomTableViewExample
//
//  Created by Estudiantes on 11/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "NumbersCustomTableViewCell.h"

@interface NumbersCustomTableViewCell()
    @property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation NumbersCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setupCellWithNumber:(NSString*)number {
     self.numberLabel.text = number;
}

+(NSString*)getIndentifier{
    return NSStringFromClass(self);
}


@end
