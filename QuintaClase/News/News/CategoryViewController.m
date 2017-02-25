//
//  CategoryViewController.m
//  News
//
//  Created by Estudiantes on 18/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoryCustomTableViewCell.h"
#import "UITableView+RegisterCustomCell.h"
#import "UITableViewCell+GetClassName.h"
#import "Category.h"
#import "NewsViewController.h"

@interface CategoryViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *categoryArray;
@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerCustomCellWithName:[CategoryCustomTableViewCell getClassName]];
    [self loadCategoryArray];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadCategoryArray{
    Category *sucesos = [[Category alloc] initWithName:@"Sucesos" imageName:@"incident"];
    Category *deportes = [[Category alloc] initWithName:@"Deportes" imageName:@"sports"];
    Category *tecnologia = [[Category alloc] initWithName:@"Tecnologia" imageName:@"technology"];
    Category *economia = [[Category alloc] initWithName:@"Economia" imageName:@"economy"];
    
    self.categoryArray = [[NSMutableArray alloc] initWithObjects:sucesos, deportes, tecnologia, economia, nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.categoryArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[CategoryCustomTableViewCell getClassName]];
    
    Category *currentCategory = self.categoryArray[indexPath.row];
    
    [cell setupCustomCellWithCategory:currentCategory];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsViewController *newsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsViewController"];
    
    Category *categorySelected = self.categoryArray[indexPath.row];
    newsViewController.categorySelected = categorySelected;
    
    [self.navigationController pushViewController:newsViewController animated:true];
}

@end
