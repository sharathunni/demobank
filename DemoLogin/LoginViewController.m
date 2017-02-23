//
//  LoginViewController.m
//  DemoLogin
//
//  Created by Sharath Unni on 1/26/17.
//  Copyright © 2017 Sharath Unni. All rights reserved.
//

#import "LoginViewController.h"
#import "DemoLogin-Bridging-Header.h"
#import "Utils.h"

@interface LoginViewController()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _LoginNameTextField.delegate = self;
    _LoginPasswordField.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//


- (IBAction)registerButtonPressed:(id)sender {

 [self performSegueWithIdentifier:@"registerSegue" sender:self];
    
}


-(void)sendRequestOverUrl:(NSURL *)url completionHandler:(void (^)(NSString * _Nullable data))completionHandler {

    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url      standardizedURL]];
    [request setHTTPMethod:@"POST"];
    NSString *post = [NSString stringWithFormat:@"username=%@&password=%@",_LoginNameTextField.text,_LoginPasswordField.text];
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)postData.length] forHTTPHeaderField:@"Content-Length"];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                                        NSString *value = [dict valueForKey:@"message"];
                                        completionHandler(value);
    }];
    
    [postDataTask resume];
}


- (void)showAlertMessageWithTitle:(NSString*)message title:(NSString*)title handler:(void (^ __nullable)(UIAlertAction *action))handler {
    
    [self.view resignFirstResponder];
    [Utils showAlertMessageWithTitle:message title:title viewController:self handler:handler];
}



- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return  YES;
}

- (IBAction)loginButtonPressed:(id )sender {

    // Check if login name and password is empty
    if([_LoginNameTextField.text  isEqual: @""] ||  [_LoginPasswordField.text  isEqual: @""])
    {
        [self showAlertMessageWithTitle:@"Please enter username and password" title:@"Error!" handler:^(UIAlertAction *action) {}];
        return ;
    }
    
    
    // Check for Port and IP
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:(@"serveripaddress")] == nil && [defaults objectForKey:(@"serverport")] == nil)
        {
              [self showAlertMessageWithTitle:@"Please configure server and port" title:@"Error!" handler:^(UIAlertAction *action) {
                  [self performSegueWithIdentifier:@"SettingsButtonPressed" sender:nil];
              }];
            return ;
        }
    
    
    
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@:%@/login",[defaults objectForKey:(@"serveripaddress")],[defaults objectForKey:(@"serverport")]]];
    [self sendRequestOverUrl:url completionHandler:^(NSString * _Nullable message) {
         NSLog(@"%@",message);
//    [self performSegueWithIdentifier:@"postloginSegue" sender:self];
        
//        dispatch_async(dispatch_get_main_queue(), ^(){     [self performSegueWithIdentifier:@"postloginSegue" sender:self];
//            
//        });
        
            if ([message isEqualToString:@"Correct Credentials"])
            {
                dispatch_async(dispatch_get_main_queue(), ^(){
                    [self performSegueWithIdentifier:@"postloginSegue" sender:self];
                });
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 
                [defaults setObject:_LoginNameTextField.text forKey:(@"loginusername")];
                [defaults setObject:_LoginPasswordField.text forKey:(@"loginpassword")];
                NSLog(@"Login Success");
            }
            else
            {
                 dispatch_async(dispatch_get_main_queue(), ^(){
                     [self showAlertMessageWithTitle:message title:@"Error!" handler:^(UIAlertAction *action) {}];
                });
                NSLog(@"Login Failed");
            }
    }];
    
    
    
    
    
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//
//    if ([_LoginNameTextField.text isEqualToString:[defaults objectForKey:@"username"]] && [_LoginPasswordField.text isEqualToString:[defaults objectForKey:@"password"]])
//        
//    {
//        NSLog(@"Login Success");
//        [self performSegueWithIdentifier:@"postloginSegue" sender:self];
//
//    }
//    
//    else
//        
//    {
//        NSLog(@"Login Failed");
//    
//    }
}
@end
