//
//  NewsViewController.m
//  News
//
//  Created by Estudiantes on 18/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsDetailViewController.h"
#import "UITableView+RegisterCustomCell.h"
#import "UITableViewCell+GetClassName.h"
#import "NewsTableViewCell.h"
#import "CDCategory.h"
#import "CDNews.h"
#import "CoreDataManager.h"

@interface NewsViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *news;
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNewsButton];
    [self.tableView registerCustomCellWithName:[NewsTableViewCell getClassName]];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    self.news = [CoreDataManager getNewsWithCategoryName:self.categoryName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addNewsButton{
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewsAction)];
    self.navigationItem.rightBarButtonItem = addButton;
}

-(void)addNewsAction{
    NewsDetailViewController *newsDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsDetailViewController"];
    newsDetailViewController.categorySelected = self.categorySelected;
    [self.navigationController pushViewController:newsDetailViewController animated:true];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[NewsTableViewCell getClassName]];
    
    News *news = self.news[indexPath.row];
    [cell setupCellWithNews:news];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.news.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end
