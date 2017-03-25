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

@interface TranslateViewController ()
@property (strong, nonatomic) NSArray *languagesArray;
@property (strong, nonatomic) NSString *originalLanguage;
@property (strong, nonatomic) NSString *destinationLanguage;
@property (weak, nonatomic) IBOutlet UIButton *originalLanguageButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *destinationLanguageButtonOutlet;

@end

@implementation TranslateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerNotifications];
    // Do any additional setup after loading the view.
    [APIManager getLanguages];
    [self.view showActivityViewWithLabel:@"Loading"];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
