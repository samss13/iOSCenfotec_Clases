//
//  EnterNameViewController.m
//  FirstClass
//
//  Created by Estudiantes on 28/1/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "EnterNameViewController.h"
#import "ShowNameViewController.h"

@interface EnterNameViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation EnterNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setNameAction:(id)sender {
    NSLog(@"BOTON PRESIONADO");
    
    ShowNameViewController *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ShowNameViewController"];
    nextViewController.name = self.nameTextField.text;
    [self.navigationController pushViewController:nextViewController animated:true];
}



@end
