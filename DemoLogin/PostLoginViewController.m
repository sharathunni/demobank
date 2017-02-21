//
//  PostLoginViewController.m
//  DemoLogin
//
//  Created by Sharath Unni on 1/26/17.
//  Copyright © 2017 Sharath Unni. All rights reserved.
//

#import "PostLoginViewController.h"
#import "Utils.h"

static NSString *const SiteURLString = @"http://10.10.0.179";
static NSString *const CookieUsername = @"demologinuser";
static NSString *const CookiePassword = @"dlpassword";

@interface PostLoginViewController ()

@end

@implementation PostLoginViewController

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

- (IBAction)submitcardButton:(id)sender {
    
    NSLog(@"Card information %@ successfully accepted.",_cardnoTextField.text);
    [Utils showAlertMessageWithTitle:@"Thank you!"  title:@"Payment Information received!" viewController:self handler:^(UIAlertAction *action) {}];
    [self setSharedCookies];
    
}

- (void) setSharedCookies {
    
    //1
    NSLog(@"Card information successfully accepted.");
    
    NSDate *currentDate = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth fromDate:currentDate];
    [components setMonth:components.month + 5];
    NSDate *expireDate = [calendar dateByAddingComponents:components toDate:currentDate options:0];
    NSTimeInterval expireInterval = [expireDate timeIntervalSince1970];
    
    NSURL *siteURL = [NSURL URLWithString:SiteURLString];
    NSDictionary *usernameProperties = @{
                                         NSHTTPCookieDomain : siteURL.host,
                                         NSHTTPCookiePath : siteURL.path,
                                         NSHTTPCookieName : @"username",
                                         NSHTTPCookieValue : CookieUsername,
                                         NSHTTPCookieExpires : @(expireInterval)
                                         };
    NSHTTPCookie *usernameCookie = [[NSHTTPCookie alloc] initWithProperties:usernameProperties];
    
    NSDictionary *passwordProperties = @{
                                         NSHTTPCookieDomain : siteURL.host,
                                         NSHTTPCookiePath : siteURL.path,
                                         NSHTTPCookieName : @"password",
                                         NSHTTPCookieValue : CookiePassword,
                                         NSHTTPCookieExpires : @(expireInterval)
                                         };
    NSHTTPCookie *passwordCookie = [[NSHTTPCookie alloc] initWithProperties:passwordProperties];
    
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookies:@[usernameCookie, passwordCookie] forURL:siteURL mainDocumentURL:nil];


    
}

@end
