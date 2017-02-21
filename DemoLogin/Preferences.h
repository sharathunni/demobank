//
//  Preferences.h
//  DemoLogin
//
//  Created by Sharath Unni on 2/17/17.
//  Copyright © 2017 Sharath Unni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Preferences : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *serveripTextField;
@property (weak, nonatomic) IBOutlet UITextField *serverportTextField;
- (IBAction)submitbuttonPressed:(id)sender;


@end
