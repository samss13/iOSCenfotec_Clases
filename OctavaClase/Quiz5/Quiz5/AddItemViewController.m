//
//  AddItemViewController.m
//  Quiz5
//
//  Created by Estudiantes on 18/3/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "AddItemViewController.h"
#import "CoreDataManager.h"


@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *quantityTextFiled;

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSaveButtonNavegationController];
    self.navigationItem.title = @"Add Item";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addSaveButtonNavegationController{
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveItem)];
    self.navigationItem.rightBarButtonItem = save;
}

-(void)saveItem{
    [CoreDataManager insertItemWithName:self.nameTextField.text quantity:[self.quantityTextFiled.text integerValue] date:[NSDate date]];
    [self.navigationController popViewControllerAnimated:TRUE];
}

@end
