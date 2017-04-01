//
//  SelectLanguageViewController.m
//  Translate
//
//  Created by Estudiantes on 1/4/17.
//  Copyright © 2017 Veux Labs. All rights reserved.
//

#import "SelectLanguageViewController.h"
#import "Constants.h"

@interface SelectLanguageViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *languagePicker;
@property (nonatomic) NSInteger indexSelected;
@end

@implementation SelectLanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectLanguageAction:(id)sender {
    if(self.delegate){
        [self.delegate closePopoverWithIndexSelected:self.indexSelected];
    }
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.languagesArray.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSDictionary *currentLanguages = self.languagesArray[row];
    return [currentLanguages valueForKey:LANGUAGE_KEY];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.indexSelected = row;
}

@end
