//
//  GetAccounts.m
//  DemoLogin
//
//  Created by Sharath Unni on 2/21/17.
//  Copyright © 2017 Sharath Unni. All rights reserved.
//

#import "GetAccounts.h"

@interface GetAccounts ()

@end

@implementation GetAccounts

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _LabelSuccessLogin.text=[NSString stringWithFormat:@"Welcome %@!",[defaults objectForKey:@"loginusername"]];
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

@end
