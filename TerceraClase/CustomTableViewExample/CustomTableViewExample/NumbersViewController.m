//
//  NumbersViewController.m
//  CustomTableViewExample
//
//  Created by Estudiantes on 11/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "NumbersViewController.h"
#import "NumbersCustomTableViewCell.h"

@interface NumbersViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation NumbersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCustomCell];
    [self loadDataSource];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registerCustomCell{
    UINib *nib = [UINib nibWithNibName:@"NumbersCustomTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"NumbersCustomTableViewCell"];
    
}

-(void)loadDataSource{
 
    self.dataSource = [NSMutableArray new];
    
    for(int i=2; i <= 5000; i++){
     if(i % 2 == 0){
         [self.dataSource addObject:[NSString stringWithFormat:@"%d", i]];
     }
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NumbersCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NumbersCustomTableViewCell"];
    
    NSString *numberToDraw = self.dataSource[indexPath.row];
    [cell setupCellWithNumber:numberToDraw];
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}


@end
