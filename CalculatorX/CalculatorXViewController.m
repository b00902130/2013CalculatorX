//
//  CalculatorXViewController.m
//  CalculatorX
//
//  Created by Wilson.Hac on 13/9/17.
//  Copyright (c) 2013年 Wilson.Hac. All rights reserved.
//

#import "CalculatorXViewController.h"

@interface CalculatorXViewController ()
@property (nonatomic) BOOL isUserInTheMiddleEnteringNumber;
@property (nonatomic) BOOL isTemp1HasGotten;
@property (nonatomic) BOOL isT1T2HasGotten;
@property (nonatomic) float outcome;
@property (nonatomic) float temp1;
@property (nonatomic) float temp2;
@property (nonatomic,strong) NSString  *operator;
@end

@implementation CalculatorXViewController


- (BOOL)isInteger:(float)number
{
    float temp;
    temp = number - (int)number;
    if (!temp) {
        return YES;
    }
    else
        return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isTemp1HasGotten = NO;
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back6@2x.jpg"]]];

    //UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back4@2x.png"]];
    //[self.view addSubview:imageView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digitPressed:(id)sender
{
    
}

- (IBAction)numberPressed:(id)sender
{
    if (!self.isTemp1HasGotten) {
        NSString *number1 = [sender currentTitle];
        NSLog(@"%@",number1);
        UILabel *myDisplay = [self displayLabel];
        
        if(self.isUserInTheMiddleEnteringNumber){
            NSString *currentDisplay = myDisplay.text;
            NSString *newText = [NSString stringWithString:myDisplay.text];
            if ([number1 isEqualToString:@"."]) {
                NSLog(@"Yes1!");
                if ([newText rangeOfString:@"."].location == NSNotFound) {
                    NSLog(@"Yes in1");
                    newText = [currentDisplay stringByAppendingString:@"."];
                    self.displayLabel.text = newText;
                }
            }
            else{
                newText = [currentDisplay stringByAppendingFormat:@"%@",number1];
                self.temp1 = [newText floatValue];
                self.displayLabel.text = newText;

            }
            
            //NSLog(@"temp1 is %d",self.temp1);
            //NSString *temp1String = [NSString stringWithFormat:@"%.0f",self.temp1];
            //self.displayLabel.text = newText;
        }
        else{
            myDisplay.text = number1;
            self.temp1 = [myDisplay.text floatValue];
            self.isUserInTheMiddleEnteringNumber = YES;
        }
    }
    else{
        NSString *number2 = [sender currentTitle];
        NSLog(@"%@",number2);
        UILabel *myDisplay2 = [self displayLabel];
        
        if(self.isUserInTheMiddleEnteringNumber){
            NSString *currentDisplay = myDisplay2.text;
            NSString *newText = [NSString stringWithString:myDisplay2.text];
            if ([number2 isEqualToString:@"."]) {
                NSLog(@"Yes2!");
                if ([newText rangeOfString:@"."].location == NSNotFound) {
                    NSLog(@"Yes in1");
                    newText = [currentDisplay stringByAppendingString:@"."];
                    self.displayLabel.text = newText;

                }            }
            else{
                newText = [currentDisplay stringByAppendingFormat:@"%@",number2];
                self.temp2 = [newText floatValue];
                self.displayLabel.text = newText;

            }
            //NSString *temp2String = [NSString stringWithFormat:@"%.0f",self.temp2];
        }
        else{
            myDisplay2.text = number2;
            self.temp2 = [myDisplay2.text floatValue];
            self.isUserInTheMiddleEnteringNumber = YES;
            self.isT1T2HasGotten = YES;
        }
    }
    
}
- (IBAction)percentButton:(UIButton *)sender
{
    if (!self.isTemp1HasGotten) {
        
        self.temp1 = [self.displayLabel.text floatValue] / 100;
        NSString *str = [NSString stringWithFormat:@"%.2f",self.temp1];
        self.displayLabel.text = str;
    }
    else{
        self.temp2 = [self.displayLabel.text floatValue] / 100;
        NSString *str = [NSString stringWithFormat:@"%.2f",self.temp2];
        self.displayLabel.text = str;
    }
}

- (IBAction)changeSign:(UIButton *)sender
{
    
    if(!self.isTemp1HasGotten){
        if (self.temp1 < 0) {
            NSMutableString *str = [NSMutableString stringWithString:self.displayLabel.text];
            NSRange rangeOfSign = [str rangeOfString:@"-"];
            [str deleteCharactersInRange:rangeOfSign];
            self.displayLabel.text = str;
            self.temp1 = [str floatValue];
        }
        else if(self.temp1 > 0) {
            NSMutableString *str = [NSMutableString stringWithString:self.displayLabel.text];
            [str insertString:@"-" atIndex:0];
            NSLog(@"%@",str);
            self.displayLabel.text = str;
            self.temp1 = [str floatValue];
            if (self.temp1 < 0) {
                NSLog(@"Yes, negative!");
            }
        }
        else{
            ;
        }
        
    }
    
    else{
        if (self.temp2 < 0) {
            NSMutableString *str = [NSMutableString stringWithString:self.displayLabel.text];
            NSRange rangeOfSign = [str rangeOfString:@"-"];
            [str deleteCharactersInRange:rangeOfSign];
            self.displayLabel.text = str;
            self.temp2 = [str floatValue];
        }
        else if(self.temp2 > 0){
            NSMutableString *str = [NSMutableString stringWithString:self.displayLabel.text];
            [str insertString:@"-" atIndex:0];
            NSLog(@"%@",str);
            self.displayLabel.text = str;
            self.temp2 = [str floatValue];
        }
        else{
            ;
        }
    }
    
}

- (IBAction)seeTemp2:(UIButton *)sender {
    NSLog(@"Temp2 is %f",self.temp2);
}

- (IBAction)seeTemp1:(UIButton *)sender {
    NSLog(@"Temp1 is %f",self.temp1);
}

- (IBAction)initialize:(UIButton *)sender
{
    self.temp1 = self.temp2 = self.outcome = 0;
    self.displayLabel.text = [NSString stringWithFormat:@"%d",0];
    self.isUserInTheMiddleEnteringNumber = NO;
    self.isT1T2HasGotten = NO;
}


/*
- (void)operatorBox:(NSString *) operator
{
    NSMutableArray *operatorStack = [[NSMutableArray alloc] init];
    [operatorStack addObject:operator];
}
*/
- (IBAction)operatorButton:(UIButton *)sender
{
    //NSString *operator = [sender currentTitle];
    
    if(self.isT1T2HasGotten){
        [self solveOutcome:sender];
        [self setOperator:sender.currentTitle];
        self.isTemp1HasGotten = YES;
        self.isUserInTheMiddleEnteringNumber = NO;
    }
    else{
        self.temp1 = [self.displayLabel.text floatValue];
        [self setOperator:sender.currentTitle];
        NSLog(@"%@",self.operator);
        self.isTemp1HasGotten = YES;
        self.isUserInTheMiddleEnteringNumber = NO;
    }
    //NSLog(@"The temp1 now is %d",self.temp1);
    //NSLog(@"The temp2 now is %d",self.temp2);
    
}


- (IBAction)solveOutcome:(UIButton *)sender
{
    //_temp2 = [self.displayLabel.text intValue];
    if (YES) {
        if ([self.operator isEqualToString:@"+"])
        {
            self.outcome = self.temp1 + self.temp2;
        }else if ([self.operator isEqualToString:@"-"])
        {
            self.outcome = self.temp1 - self.temp2;
        }else if ([self.operator isEqualToString:@"×"])
        {
            self.outcome = self.temp1 * self.temp2;
        }else if ([self.operator isEqualToString:@"÷"])
        {
            self.outcome = self.temp1 / self.temp2;
        }
    }
    NSString *answer;
    if ([self isInteger:self.outcome]){
        answer = [NSString stringWithFormat:@"%d",(int)self.outcome];
    }
    else{
        answer = [NSString stringWithFormat:@"%.2f",self.outcome];
    }
    self.displayLabel.text = answer;
    NSLog(@"Outcome is %f",self.outcome);
    self.temp1 = self.outcome;
    self.isTemp1HasGotten = NO;
    self.isUserInTheMiddleEnteringNumber = NO;
    self.isT1T2HasGotten = NO;
    //NSLog(@"The temp1 now is %d",self.temp1);
    //NSLog(@"The temp2 now is %d",self.temp2);
}

- (IBAction)isTempGot:(UIButton *)sender
{
    NSLog(@"isTempGot is %d",self.isTemp1HasGotten);
    NSLog(@"isUserEntering is %d",self.isUserInTheMiddleEnteringNumber);
}
@end
