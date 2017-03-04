//
//  NewsTableViewCell.m
//  News
//
//  Created by Estudiantes on 25/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "News.h"

@interface NewsTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCellWithNews:(News*)news{
    self.titleLabel.text = news.title;
    NSString *dateString = [NSDateFormatter localizedStringFromDate:news.date dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
    self.dateLabel.text = dateString;
}

@end
