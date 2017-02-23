//
//  ChangePassword.h
//  DemoLogin
//
//  Created by Sharath Unni on 2/21/17.
//  Copyright © 2017 Sharath Unni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePassword : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *LabelChangePassSuccess;
@property (weak, nonatomic) IBOutlet UITextField *newpasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *changeunameTextField;
- (IBAction)changePasswordButtonPressed:(id)sender;

@end
