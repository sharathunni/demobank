//
//  ChangePassword.m
//  DemoLogin
//
//  Created by Sharath Unni on 2/21/17.
//  Copyright © 2017 Sharath Unni. All rights reserved.
//

#import "ChangePassword.h"

@interface ChangePassword ()

@end

@implementation ChangePassword

- (void)viewDidLoad {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [super viewDidLoad];
    [_changeunameTextField setEnabled:NO];
    [_changeunameTextField setAllowsEditingTextAttributes:NO];
    _changeunameTextField.text=[defaults objectForKey:@"loginusername"];
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

-(void)sendRequestOverUrl:(NSURL *)url completionHandler:(void (^)(NSDictionary * _Nullable data))completionHandler {
    
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url      standardizedURL]];
    [request setHTTPMethod:@"POST"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *post = [NSString stringWithFormat:@"username=%@&newpassword=%@",_changeunameTextField.text,_newpasswordTextField.text];
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)postData.length] forHTTPHeaderField:@"Content-Length"];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        completionHandler(dict);
        
    }];
    
    [postDataTask resume];
    
}

- (IBAction)changePasswordButtonPressed:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@:%@/changepassword",[defaults objectForKey:(@"serveripaddress")],[defaults objectForKey:(@"serverport")]]];
    [self sendRequestOverUrl:url completionHandler:^(NSDictionary * _Nullable message) {
        NSLog(@"%@",[message objectForKey:@"message"]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            _LabelChangePassSuccess.text=[NSString stringWithFormat:@"%@",[message objectForKey:@"message"]];
        });
    }];
    
}
@end
