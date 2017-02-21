//
//  ViewController.h
//  DemoLogin
//
//  Created by Sharath Unni on 1/25/17.
//  Copyright © 2017 Sharath Unni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController


- (IBAction)signupButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *EmailTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *DateofBirthTextField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *UsernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *FNTextField;


@end

