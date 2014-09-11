//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Vince Magistrado on 9/10/14.
//  Copyright (c) 2014 Vince Magistrado. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
- (IBAction)onTap:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"default_tip"];
    
    // integerForKey returns 0 if not found
    if (intValue == 0) {
        intValue = 2;   // 15% is default
    }
    
    // set tipControl to selected value
    self.tipControl.selectedSegmentIndex = intValue - 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    // store new setting with a +1 offset (default value of 0 will indicate it's not set)
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.tipControl.selectedSegmentIndex+1 forKey:@"default_tip"];
    [defaults synchronize];
}
@end
