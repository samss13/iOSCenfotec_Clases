//
//  NewsDetailViewController.m
//  News
//
//  Created by Estudiantes on 25/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "CoreDataManager.h"

@interface NewsDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *newsTitleTextField;
@property (weak, nonatomic) IBOutlet UITextView *newsDescriptionTextView;

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSaveButtonNavegationController];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)addSaveButtonNavegationController{
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNews)];
    self.navigationItem.rightBarButtonItem = save;
}

-(void)saveNews{
    [CoreDataManager insertNewsWithTitle:self.newsTitleTextField.text description:self.newsDescriptionTextView.text categoryName:self.categoryName];
    [self.navigationController popViewControllerAnimated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissKeyboard:(id)sender {
    [self.view endEditing:YES];
}

#pragma mark - Table view data source

@end
