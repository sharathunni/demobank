//
//  DoTransfer.m
//  DemoLogin
//
//  Created by Sharath Unni on 2/21/17.
//  Copyright © 2017 Sharath Unni. All rights reserved.
//

#import "DoTransfer.h"

@interface DoTransfer ()

@end

@implementation DoTransfer


- (void)viewDidLoad {
    [super viewDidLoad];
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
    NSString *post = [NSString stringWithFormat:@"username=%@&password=%@",[defaults objectForKey:@"loginusername"],[defaults objectForKey:@"loginpassword"]];
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

-(void)sendRequestOverUrl_transfer:(NSURL *)url completionHandler:(void (^)(NSDictionary * _Nullable data))completionHandler {
    
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url      standardizedURL]];
    [request setHTTPMethod:@"POST"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *post = [NSString stringWithFormat:@"username=%@&password=%@&from_acc=%@&to_acc=%@&amount=%@",[defaults objectForKey:@"loginusername"],[defaults objectForKey:@"loginpassword"], _toAccountTextField.text, _fromAccountTextField.text, _AmountTextField.text];
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


- (IBAction)AccountDetailsButtonPressed:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@:%@/getaccounts",[defaults objectForKey:(@"serveripaddress")],[defaults objectForKey:(@"serverport")]]];
    [self sendRequestOverUrl:url completionHandler:^(NSDictionary * _Nullable message) {
        NSLog(@"%@ : %@",[message objectForKey:@"to"] , [message objectForKey:@"from"]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            _fromAccountTextField.text=[NSString stringWithFormat:@"%@",[message objectForKey:@"from"]];
            _toAccountTextField.text=[NSString stringWithFormat:@"%@",[message objectForKey:@"to"]];
        });
    }];
    
}

- (IBAction)TransferButtonPressed:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@:%@/dotransfer",[defaults objectForKey:(@"serveripaddress")],[defaults objectForKey:(@"serverport")]]];
    [self sendRequestOverUrl_transfer:url completionHandler:^(NSDictionary * _Nullable message) {
        NSLog(@"%@",[message objectForKey:@"message"]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            _LablelTransferSuccess.text=[NSString stringWithFormat:@"%@",[message objectForKey:@"message"]];
        });
    }];

    
}
@end
