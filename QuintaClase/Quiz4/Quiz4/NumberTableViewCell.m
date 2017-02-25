//
//  NumberTableViewCell.m
//  Quiz4
//
//  Created by Estudiantes on 25/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "NumberTableViewCell.h"

@interface NumberTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@end

@implementation NumberTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCustomCellWithNumber:(NSString*) number{
    self.numberLabel.text = number;
}

@end
