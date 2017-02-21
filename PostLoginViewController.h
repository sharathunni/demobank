//
//  PostLoginViewController.h
//  DemoLogin
//
//  Created by Sharath Unni on 1/26/17.
//  Copyright © 2017 Sharath Unni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostLoginViewController : UIViewController
- (IBAction)submitcardButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *AddressTextField;
@property (weak, nonatomic) IBOutlet UITextField *ExpiryYearTextField;
@property (weak, nonatomic) IBOutlet UITextField *ExpiryMonthTextField;
@property (weak, nonatomic) IBOutlet UITextField *NameTextField;
@property (weak, nonatomic) IBOutlet UITextField *cardnoTextField;




@end
