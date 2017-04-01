//
//  SelectLanguageViewController.h
//  Translate
//
//  Created by Estudiantes on 1/4/17.
//  Copyright © 2017 Veux Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectLanguageViewControllerDelegate <NSObject>

-(void)closePopoverWithIndexSelected:(NSInteger)indexSelected;

@end

@interface SelectLanguageViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) NSArray *languagesArray;
@property (assign,nonatomic) id<SelectLanguageViewControllerDelegate> delegate;
@end
