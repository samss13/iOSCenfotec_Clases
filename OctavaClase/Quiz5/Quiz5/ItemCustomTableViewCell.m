//
//  ItemCustomTableViewCell.m
//  Quiz5
//
//  Created by Estudiantes on 18/3/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "ItemCustomTableViewCell.h"
#import "Item.h"

@interface ItemCustomTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *QuantityLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@end

@implementation ItemCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadDataCustomCellWithItem:(Item*)item{
    self.nameLabel.text = item.name;
    self.QuantityLabel.text = [NSString stringWithFormat:@"%d", item.quantity.intValue];
    NSString *dateString = [NSDateFormatter localizedStringFromDate:item.date dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
    self.dateLabel.text = dateString;

}

@end
