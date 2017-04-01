//
//  TranslateViewController.m
//  Translate
//
//  Created by Cesar Brenes on 3/18/17.
//  Copyright © 2017 Veux Labs. All rights reserved.
//

#import "TranslateViewController.h"
#import "APIManager.h"
#import "Constants.h"
#import "UIView+RNActivityView.h"
#import "BizPopupViewController.h"
#import "SelectLanguageViewController.h"

@interface TranslateViewController ()<SelectLanguageViewControllerDelegate, UITextViewDelegate>
@property (strong, nonatomic) NSArray *languagesArray;
@property (strong, nonatomic) NSString *originalLanguage;
@property (strong, nonatomic) NSString *destinationLanguage;
@property (weak, nonatomic) IBOutlet UIButton *originalLanguageButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *destinationLanguageButtonOutlet;
@property (strong, nonatomic) BIZPopupViewController *poppverViewController;
@property (nonatomic) BOOL isOriginLanguagesSelected;
@property (weak, nonatomic) IBOutlet UITextView *originalLanguageTextField;
@property (weak, nonatomic) IBOutlet UITextView *destinationLanguageTextField;

@end

@implementation TranslateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerNotifications];
    // Do any additional setup after loading the view.
    [APIManager getLanguages];
    [self.view showActivityViewWithLabel:@"Loading"];
    self.originalLanguageTextField.delegate = self;
}

-(void)registerNotifications{
    //selector:@selector(getLenguages:) se utilizan los : para decir que recibe un parametro y el parametro que envia es lo que recibe del notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getLenguages:) name:GET_LENGUAGES_NOTIFICATION object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getErrorNotification:) name:ERROR_FOUND_NOTIFICATION object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getTranslatedNotification:) name:TEXT_TRANSLATED_KEY object:nil];
    
}

-(void)getLenguages:(NSNotification*)notification{
    self.languagesArray = [notification.userInfo valueForKey:LANGUAGES_ARRAY_KEY];
    self.originalLanguage = [[self.languagesArray.firstObject valueForKey:DIRS_KEY] uppercaseString];
    self.destinationLanguage = [[self.languagesArray[1] valueForKey:DIRS_KEY] uppercaseString];
    
    [self setTitlesInButtons];
    
    [self.view hideActivityView];
}

-(void)setTitlesInButtons{
    [self.originalLanguageButtonOutlet setTitle:self.originalLanguage forState:UIControlStateNormal];
    [self.destinationLanguageButtonOutlet setTitle:self.destinationLanguage forState:UIControlStateNormal];
}

-(void)getErrorNotification:(NSNotification*)notification{
    [self.view hideActivityView];
}

-(void)getTranslatedNotification:(NSNotification*)notification{
    NSString *textTranslated = [notification.userInfo valueForKey:TRANSLATE_RESULT_KEY];
    self.destinationLanguageTextField.text = textTranslated;
    [self.view hideActivityView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchLanguageButtonAction:(id)sender {
    NSString *bkOriginaLanguage = self.originalLanguage;
    self.originalLanguage = self.destinationLanguage;
    self.destinationLanguage = bkOriginaLanguage;
    [self setTitlesInButtons];
}
- (IBAction)destinationLanguageAction:(id)sender {
    self.isOriginLanguagesSelected = FALSE;
    [self presentPopoverController];
}

- (IBAction)originalLanguageAction:(id)sender {
    self.isOriginLanguagesSelected = TRUE;
    [self presentPopoverController];
}

-(void)presentPopoverController{
    SelectLanguageViewController *selectLanguageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectLanguageViewController"];
    selectLanguageViewController.delegate = self;
    selectLanguageViewController.languagesArray = self.languagesArray;
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    self.poppverViewController = [[BIZPopupViewController alloc] initWithContentViewController:selectLanguageViewController contentSize:CGSizeMake(screenSize.width*0.8, screenSize.height*0.8)];
    [self presentViewController:self.poppverViewController animated:YES completion:nil];
}

-(void)closePopoverWithIndexSelected:(NSInteger)indexSelected{
    
    NSDictionary *languageSelected = self.languagesArray[indexSelected];
    NSString *language = [[languageSelected valueForKey:DIRS_KEY]uppercaseString];
    if (self.isOriginLanguagesSelected) {
        self.originalLanguage = language;
    }else{
        self.destinationLanguage = language;
    }
    self.isOriginLanguagesSelected = false;
    [self setTitlesInButtons];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        [self makeTranslate];
        return NO;
    }
    return YES;
}

-(void)makeTranslate{
    [self.view showActivityViewWithLabel:@"Loading"];
    [APIManager createTranslateWithOriginalLanguages:self.originalLanguage destinationLanguage:self.destinationLanguage textToTranslate:self.originalLanguageTextField.text];
}

@end
