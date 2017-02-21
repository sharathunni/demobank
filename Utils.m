//
//  Utils.m
//  DemoLogin
//
//  Created by Sharath Unni on 2/17/17.
//  Copyright © 2017 Sharath Unni. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (void)showAlertMessageWithTitle:(NSString*)message title:(NSString*)title viewController:(UIViewController*)viewController handler:(void (^ __nullable)(UIAlertAction *action))handler {
    UIAlertController *saved = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Ok"
                                                          style:UIAlertActionStyleDestructive
                                                        handler:handler];
    
    
    [saved addAction:alertAction];
    [viewController presentViewController:saved animated:YES completion:nil];
}
@end
