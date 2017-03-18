//
//  ItemsViewController.m
//  Quiz5
//
//  Created by Estudiantes on 18/3/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "ItemsViewController.h"
#import "ItemCustomTableViewCell.h"
#import "Item.h"
#import "CoreDataManager.h"
#import "AddItemViewController.h"

@interface ItemsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *itemsArray;

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCustomCell];
    [self addInsertButtonNavegationController];
    self.navigationItem.title = @"Items";
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    self.itemsArray = [CoreDataManager getAllItems];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registerCustomCell{
    UINib *nib = [UINib nibWithNibName:@"ItemCustomTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"ItemCustomTableViewCell"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ItemCustomTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ItemCustomTableViewCell"];
    
    [cell loadDataCustomCellWithItem:self.itemsArray[indexPath.row]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(void)addInsertButtonNavegationController{
    UIBarButtonItem *insert = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertItem)];
    self.navigationItem.rightBarButtonItem = insert;
}

-(void)insertItem{
    AddItemViewController *addItemViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddItemViewController"];
    [self.navigationController pushViewController:addItemViewController animated:true];
}

@end
