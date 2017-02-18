//
//  PrimeNumbersViewController.m
//  Quiz3
//
//  Created by Estudiantes on 18/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "PrimeNumbersViewController.h"
#import "PrimeCustomTableViewCell.h"

@interface PrimeNumbersViewController () <UITableViewDataSource, UITableViewDelegate>
    @property (weak, nonatomic) IBOutlet UITableView *tableView;
    @property (strong, nonatomic) NSMutableArray *dataArray;
@end

@implementation PrimeNumbersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCellCustom];
     [self loadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData{
    self.dataArray = [NSMutableArray new];
    for (int j=2;j<=1000;j++){
        int a=0;
        for(int i=1;i<=1000;i++)
        {
            if(j%i==0)
                a++;
        }
        if (a==2){
            [self.dataArray addObject:[NSString stringWithFormat:@"%d", j]];
        }
    }
}

-(void)registerCellCustom{
    UINib *nib = [UINib nibWithNibName:@"PrimeCustomTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"PrimeCustomTableViewCell"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PrimeCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PrimeCustomTableViewCell"];
    
    [cell setupLabelWithNumber:self.dataArray[indexPath.row]];
    
    return cell;
}




@end
