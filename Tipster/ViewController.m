//
//  ViewController.m
//  Tipster
//
//  Created by Fabiola E. Robles Vega on 6/25/20.
//  Copyright © 2020 Fabiola E. Robles Vega. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@property (weak, nonatomic) IBOutlet UILabel *totalPhraseLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    //Hiding Keyboard on tap
    [self.view endEditing:YES];
    
    
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.billTextField.text doubleValue];
    
    NSArray *percentages = @[@(0.15),@(0.2),@(0.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex]doubleValue];
    double tip = tipPercentage*bill;
    double total = bill+tip;
    self.tipLabel.text = [NSString stringWithFormat:@"$ %.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$ %.2f", total];
}

- (IBAction)onEditingStart:(id)sender {
    self.totalLabel.alpha=0;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.totalPhraseLabel.text= @"Total...";        self.totalLabel.frame=CGRectMake(self.totalLabel.frame.origin.x, self.totalLabel.frame.origin.y-30, self.totalLabel.frame.size.width, self.totalLabel.frame.size.height);
        
    }];
    
}
- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.totalLabel.frame;
    newFrame.origin.y+=30;
    [UIView animateWithDuration:0.3 animations:^{
        self.totalLabel.frame=newFrame;
        self.totalLabel.alpha=1;
         self.totalPhraseLabel.alpha=1;self.totalPhraseLabel.text= @"Total";    }];
}

@end
