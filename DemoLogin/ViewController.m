//
//  ViewController.m
//  DemoLogin
//
//  Created by Sharath Unni on 1/25/17.
//  Copyright © 2017 Sharath Unni. All rights reserved.
//

#import "ViewController.h"
#import "Utils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)signupButton:(id)sender {
    
    
    if ([_FNTextField.text isEqualToString:@""] || [_EmailTextField.text isEqualToString:@""] ||  [_PasswordTextField.text isEqualToString:@""] || [_UsernameTextField.text isEqualToString:@""])
    
    {
        NSLog(@"This is being typed");
        [Utils showAlertMessageWithTitle:@"Please fill in all the fields"  title:@"Error!" viewController:self handler:^(UIAlertAction *action) {}];
        
    }

    [self registerNewUser];
    
    }

- (void) registerNewUser {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:_FNTextField.text forKey:(@"fullname")];
    [defaults setObject:_UsernameTextField.text forKey:(@"username")];
    [defaults setObject:_EmailTextField.text forKey:(@"email")];
    [defaults setObject:_DateofBirthTextField.minimumDate forKey:(@"dob")];
    [defaults setObject:_PasswordTextField.text forKey:(@"password")];
    [defaults synchronize];
    
    NSLog(@"Registration in progress");
    UIAlertController *success = [UIAlertController alertControllerWithTitle:@"Registration success!" message:@"Thank you for signing up with us" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Ok"
                                                          style:UIAlertActionStyleDestructive
                                                        handler:^(UIAlertAction *action) {
                                                            NSLog(@"Dismiss button tapped!");
                                                        }];
    
      [success addAction:alertAction];
      [self presentViewController:success animated:YES completion:nil];
    
}
@end
