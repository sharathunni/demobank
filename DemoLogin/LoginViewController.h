//
//  LoginViewController.h
//  DemoLogin
//
//  Created by Sharath Unni on 1/26/17.
//  Copyright © 2017 Sharath Unni. All rights reserved.
//

#import <UIKit/UIKit.h>

#define servURL @"http://192.168.0.128:8888/login"
#define paramUname "@pname"
#define paramPass "@ppass"

@interface LoginViewController : UIViewController <NSURLConnectionDelegate,NSURLSessionDelegate,UITextFieldDelegate>
@property (nonatomic, strong) NSURLConnection *connection;

- (IBAction)loginButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *LoginNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *LoginPasswordField;



- (IBAction)registerButtonPressed:(id)sender;


@end
