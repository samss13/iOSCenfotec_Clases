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
#import "NewsViewController.h"
#import "CoreDataManager.h"

@interface CategoryViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *categoryArray;
@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerCustomCellWithName:[CategoryCustomTableViewCell getClassName]];
    self.categoryArray = [CoreDataManager getAllCategories];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.categoryArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[CategoryCustomTableViewCell getClassName]];
    
    CDCategory *currentCategory = self.categoryArray[indexPath.row];
    
    [cell setupCustomCellWithCategory:currentCategory];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsViewController *newsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsViewController"];
    
    CDCategory *categorySelected = self.categoryArray[indexPath.row];
    newsViewController.categoryName = categorySelected.name;
    
    [self.navigationController pushViewController:newsViewController animated:true];
}

@end
