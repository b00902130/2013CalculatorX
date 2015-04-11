//
//  CalculatorXViewController.h
//  CalculatorX
//
//  Created by Wilson.Hac on 13/9/17.
//  Copyright (c) 2013年 Wilson.Hac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorXViewController : UIViewController
- (IBAction)percentButton:(UIButton *)sender;
- (IBAction)changeSign:(UIButton *)sender;
- (IBAction)seeTemp2:(UIButton *)sender;
- (IBAction)seeTemp1:(UIButton *)sender;
- (IBAction)initialize:(UIButton *)sender;
- (IBAction)operatorButton:(UIButton *)sender;
- (BOOL)isInteger:(float)number;
@property (strong, nonatomic) IBOutlet UILabel *displayLabel;
@property (strong, nonatomic) IBOutlet UIButton *numberButton;
- (IBAction)solveOutcome:(UIButton *)sender;
- (IBAction)isTempGot:(UIButton *)sender;

//@property (nonatomic,strong) NSStringsymbol;
- (IBAction)numberPressed:(UIButton *)sender;

@end
