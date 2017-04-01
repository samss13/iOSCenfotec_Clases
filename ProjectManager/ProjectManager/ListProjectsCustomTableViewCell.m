//
//  ListProjectsCustomTableViewCell.m
//  ProjectManager
//
//  Created by Sam Santamaria on 3/25/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import "ListProjectsCustomTableViewCell.h"
#import "Proyecto.h"

@interface ListProjectsCustomTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *descriptionProjectLabel;
@property (weak, nonatomic) IBOutlet UILabel *identifierProjectLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateProjectLabel;

@end

@implementation ListProjectsCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCustomCellWithProject:(Proyecto*)project{
    self.descriptionProjectLabel.text = project.descripcionProject;
    self.identifierProjectLabel.text = project.identificador;
    self.stateProjectLabel.text = project.estado;
}

@end
