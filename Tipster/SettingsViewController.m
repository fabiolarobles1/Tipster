//
//  SettingsViewController.m
//  Tipster
//
//  Created by Fabiola E. Robles Vega on 7/3/20.
//  Copyright © 2020 Fabiola E. Robles Vega. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userPercentField;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)onTapScreen:(id)sender {
    //Hiding Keyboard on tap
       [self.view endEditing:YES];
}


- (IBAction)onEdit:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:[self.userPercentField.text doubleValue]  forKey:@"default_tip_percentage"];
    [defaults synchronize];
    NSLog(@"WOOOOO  %@", [defaults valueForKey:@"default_tip_percentage"] );
   

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
