//
//  Preferences.m
//  DemoLogin
//
//  Created by Sharath Unni on 2/17/17.
//  Copyright © 2017 Sharath Unni. All rights reserved.
//

#import "Preferences.h"
#import "Utils.h"

@interface Preferences ()

@end

@implementation Preferences

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) serveripsettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:_serveripTextField.text forKey:(@"serveripaddress")];
    [defaults setObject:_serverportTextField.text forKey:(@"serverport")];
    [defaults synchronize];
    
    
    NSLog(@"Server details being received");
    [Utils showAlertMessageWithTitle:@"Server details saved"  title:@"Success!" viewController:self handler:^(UIAlertAction *action) {
     [self.navigationController popViewControllerAnimated:YES];
    }];
    
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

- (IBAction)submitbuttonPressed:(id)sender {
    
        [self serveripsettings];
}
@end
