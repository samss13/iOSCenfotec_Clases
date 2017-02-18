//
//  CategoryCustomTableViewCell.m
//  News
//
//  Created by Estudiantes on 18/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "CategoryCustomTableViewCell.h"
#import "Category.h"

@interface CategoryCustomTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *categoryImageView;

@end

@implementation CategoryCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCustomCellWithCategory:(Category*)category{
    self.categoryImageView.image = [UIImage imageNamed:category.imageName];
    self.categoryNameLabel.text = category.name;
}

@end
