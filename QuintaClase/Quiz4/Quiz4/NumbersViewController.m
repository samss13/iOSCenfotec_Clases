//
//  NumbersViewController.m
//  Quiz4
//
//  Created by Estudiantes on 25/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "NumbersViewController.h"
#import "NumberTableViewCell.h"

@interface NumbersViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *buttonCalculate;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (nonatomic, strong) NSMutableArray *arrayNumbers;

@end

@implementation NumbersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCustomCell];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registerCustomCell{
    UINib *nib = [UINib nibWithNibName:@"NumberTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"NumberTableViewCell"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayNumbers.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NumberTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"NumberTableViewCell"];
    
    NSString *data = self.arrayNumbers[indexPath.row];
    
    [cell setupCustomCellWithNumber:data];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
- (IBAction)calculateButtonAction:(id)sender {
    self.arrayNumbers = [NSMutableArray new];
    NSString *numberStr = self.numberTextField.text;
    
    if ([self isEmpty:numberStr]) {
        for(int count = 1; count <= 10; count++){
            int result = [numberStr intValue] * count;
            [self.arrayNumbers addObject:[NSString stringWithFormat:@"%@ X %d = %d", numberStr, count, result]];
        }
        [self.tableView reloadData];
        [self.view endEditing:YES];
    }
}

- (BOOL)isEmpty:(NSString *)string{
    NSString *trimedString = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

        if([trimedString length]>0)
        {
            return YES;
        }
        else
            return NO;
}

@end
