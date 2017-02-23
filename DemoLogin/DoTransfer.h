//
//  DoTransfer.h
//  DemoLogin
//
//  Created by Sharath Unni on 2/21/17.
//  Copyright © 2017 Sharath Unni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoTransfer : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *LablelTransferSuccess;
@property (weak, nonatomic) IBOutlet UITextField *fromAccountTextField;
@property (weak, nonatomic) IBOutlet UITextField *toAccountTextField;
@property (weak, nonatomic) IBOutlet UITextField *AmountTextField;
- (IBAction)AccountDetailsButtonPressed:(id)sender;
- (IBAction)TransferButtonPressed:(id)sender;

@end
