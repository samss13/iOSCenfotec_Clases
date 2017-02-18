//
//  PrimeCustomTableViewCell.m
//  Quiz3
//
//  Created by Estudiantes on 18/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "PrimeCustomTableViewCell.h"

@interface PrimeCustomTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *labelCellCustom;

@end

@implementation PrimeCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupLabelWithNumber:(NSString*) number{
    self.labelCellCustom.text = number;
}

@end
